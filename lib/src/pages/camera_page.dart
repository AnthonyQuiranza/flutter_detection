import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:detection/src/componets/result_alert_component.dart';
import 'package:detection/src/models/api_model.dart';
import 'package:detection/src/models/style_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? imagen;
  bool loading = true;
  bool enabledAnalizar = false;
  final picker = ImagePicker();
  bool clicAnalizar = false;
  Future selImagen(op) async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String appPath = appDirectory.path;
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    File saveImage;
    File saveImage2;
    print('BASE DE APP: $appPath ');

    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
      imagen = File(pickedFile.path);
      saveImage = await imagen!.copy('$appDocPath/image1.png');
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
      imagen = File(pickedFile.path);
      saveImage = await imagen!.copy('$appDocPath/image1.png');
    }

    setState(() {
      if (pickedFile != null) {
        cortar(File(pickedFile.path));
      } else {
        print('No hay imagen seleccionada');
      }
    });
  }

  cortar(picked) async {
    File? cortado = await ImageCropper().cropImage(
        sourcePath: picked.path,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cortar imagen',
            toolbarColor: Colors.green,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
        maxHeight: 500,
        compressQuality: 60,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]);
    //-----------------SAVE IMAGE -------------//
    Uint8List? bytes = await cortado?.readAsBytes();
    var result = await ImageGallerySaver.saveImage(bytes!,
        quality: 60, name: "AgroTech.jpg");
    print(result);
    if (result["isSuccess"] == true) {
      print("Imagen guardada exitosamente.");
    } else {
      print(result["errorMessage"]);
    }
    //---------SAVE IMAGE------//
    if (cortado != null) {
      setState(() {
        imagen = cortado;
        enabledAnalizar = true;
      });
    }
  }

  Dio dio = Dio();
  String urlImage = "";
  String? urlImageResult;
  String? diseaseImageResult;
  Future<void> analizarImagen() async {
    setState(() {
      clicAnalizar = true;
    });
    try {
      String filename = imagen!.path.split('/').last;
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imagen!.path, filename: filename)
      });
      await dio
          .post('https://alexquiranza.com/detection/uploadimage.php',
              data: formData)
          .then((value) {
        if (value.toString() != null) {
          print(value.toString());
          urlImage = value.toString();
          postData(urlImage);
        } else {
          print("Error al subir la imagen");
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

//---------------------------POST----------------//
  postData(String url) async {
    try {
      var response = await http.post(
        Uri.parse('https://detectionapi.azurewebsites.net/api/test/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'url': url,
        }),
      );
      //print(response.body);
      ImgResult result = ImgResult.fromJson(jsonDecode(response.body));
      Map<String, dynamic> listResultado =
          jsonDecode(json.encode((result.result.last)));
      print("El último elemento es ${listResultado['url']}");
      setState(() {
        urlImageResult = listResultado['url'].toString();
        diseaseImageResult = listResultado['disease_name'.toString()];
        loading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

//--------------------------- FIN    POST----------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        title: Text(
          'Detección',
          textAlign: TextAlign.center,
          textScaleFactor: 1.2,
        ),
        toolbarTextStyle: TextStyle(fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.green,
                    ),
                    TextButton(
                        onPressed: () {
                          urlImageResult = null;
                          imagen = null;
                          loading = true;
                          clicAnalizar = false;
                          selImagen(1);
                        },
                        child: Text(
                          'Usar Cámara',
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.5,
                          style: titleStyle,
                        ))
                  ],
                ),
              ),
              Card(
                elevation: 10,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Icon(
                      Icons.image_search,
                      size: 50,
                      color: Colors.green,
                    ),
                    TextButton(
                        onPressed: () {
                          urlImageResult = null;
                          imagen = null;
                          loading = true;
                          clicAnalizar = false;
                          selImagen(2);
                        },
                        child: Text(
                          'Usar Galería',
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.5,
                          style: titleStyle,
                        ))
                  ],
                ),
              ),
            ],
          ),
          Card(
            elevation: 10,
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: ListTile(
              enabled: enabledAnalizar,
              textColor: Colors.black,
              iconColor: Colors.green,
              leading: Icon(Icons.screen_search_desktop_rounded, size: 50),
              title: Text(
                'Analizar imagen',
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
              trailing: Icon(Icons.navigate_next, size: 50),
              onTap: () {
                analizarImagen();
              },
            ),
          ),
          (loading == true && clicAnalizar == false && urlImageResult == null)
              ? Container(
                  height: 0,
                )
              : _resultButton(),
          Container(
            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: _buildChild(),
          )
        ],
      ),
    );
  }

  Widget _buildChild() {
    if (urlImageResult == null && imagen != null) {
      return Image.file(imagen!);
    } else {
      return Center();
    }
  }

  Widget _resultButton() {
    if (loading == true) {
      return Center(
        child: Container(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(color: Colors.green),
        ),
      );
    } else {
      return ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.green),
          onPressed: () =>
              resultAlert(context, urlImageResult!, diseaseImageResult!),
          icon: Icon(
            Icons.check,
          ),
          label: Text('Ver resultado'));
    }
  }
}

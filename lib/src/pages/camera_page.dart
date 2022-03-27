import 'dart:convert';
import 'dart:io';

import 'package:detection/src/models/api_model.dart';
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
  bool enabledAnalizar = false;
  final picker = ImagePicker();
  Future selImagen(op) async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String appPath = appDirectory.path;
    File _image;
    print('BASE DE APP: $appPath ');

    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
      imagen = File(pickedFile.path);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        // imagen = File(pickedFile.path);
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
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]);
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
  Future<void> analizarImagen() async {
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
        title: Text('Cámara'),
        elevation: 20,
        toolbarTextStyle: TextStyle(fontWeight: FontWeight.w800),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.green,
            leading: Icon(Icons.camera, size: 50),
            title: Text('Usar cámara'),
            trailing: Icon(Icons.navigate_next, size: 50),
            onTap: () {
              urlImageResult = null;
              imagen = null;
              selImagen(1);
            },
          ),
          Divider(
            thickness: 1,
            height: 20,
            color: Colors.green,
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.green,
            leading: Icon(Icons.image_search, size: 50),
            title: Text('Usar Galería'),
            trailing: Icon(Icons.navigate_next, size: 50),
            onTap: () {
              urlImageResult = null;
              imagen = null;
              selImagen(2);
            },
          ),
          Divider(
            thickness: 1,
            color: Colors.green,
          ),
          ListTile(
            enabled: enabledAnalizar,
            textColor: Colors.black,
            iconColor: Colors.green,
            leading: Icon(Icons.screen_search_desktop_rounded, size: 50),
            title: Text('Analizar imagen'),
            trailing: Icon(Icons.navigate_next, size: 50),
            onTap: () {
              analizarImagen();
            },
          ),
          Divider(
            thickness: 1,
            color: Colors.green,
          ),
          Container(
            width: 100,
            margin: EdgeInsets.all(20),
            child: _buildChild(),
          )
        ],
      ),
    );
  }

  Widget _buildChild() {
    if (urlImageResult == null && imagen != null) {
      return Image.file(imagen!);
    } else if (urlImageResult != null) {
      return Image.network(urlImageResult!);
    } else {
      return Center();
    }
  }
}
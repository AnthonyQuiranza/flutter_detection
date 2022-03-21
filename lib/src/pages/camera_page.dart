import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? imagen;
  late final File newImage;
  final picker = ImagePicker();
  Future selImagen(op) async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String appPath = appDirectory.path;
    print('BASE DE APP: $appPath ');

    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
      imagen = File(pickedFile.path);
      newImage = await imagen!.copy('$appPath/detectionImage.png');
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print('No hay imagen seleccionada');
      }
    });
  }

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
              selImagen(2);
            },
          ),
          Divider(
            thickness: 1,
            color: Colors.green,
          ),
          Container(
            width: 100,
            margin: EdgeInsets.all(20),
            child: imagen != null ? Image.file(imagen!) : Center(),
          )
        ],
      ),
    );
  }
}

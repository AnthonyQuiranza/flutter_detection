// ignore_for_file: prefer_const_constructors

import 'package:detection/src/models/style_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _videoURL = Uri.parse('https://youtu.be/7p1y6aqcJbM');

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _menuList(context),
    );
  }

  Widget _menuList(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Image(
          image: AssetImage('assets/images/logofarm.png'),
          height: 200.0,
        ),
        Divider(height: 30),
        Card(
          elevation: 10,
          color: Colors.white,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: ListTile(
            textColor: Colors.black,
            iconColor: Colors.green,
            leading: Icon(Icons.remove_red_eye, size: 50),
            title: Text(
              'Detectar',
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: titleStyle,
            ),
            subtitle: Text(
              'Detecta enfermedades usando tu cámara o una fotografía de Galería',
              textScaleFactor: 1.2,
              textAlign: TextAlign.justify,
              style: subtitleStyle,
            ),
            trailing: Icon(Icons.navigate_next, size: 50),
            onTap: () {
              Navigator.pushNamed(context, 'camera');
            },
          ),
        ),
        Divider(height: 30),
        Card(
          elevation: 10,
          color: Colors.white,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: ListTile(
            textColor: Colors.black,
            iconColor: Colors.green,
            leading: Icon(Icons.help, size: 50),
            title: Text(
              '¿Cómo funciona?',
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: titleStyle,
            ),
            subtitle: Text(
              '¿Tienes dudas de cómo usar Agrotech?',
              textScaleFactor: 1.2,
              textAlign: TextAlign.justify,
              style: subtitleStyle,
            ),
            trailing: Icon(Icons.navigate_next, size: 50),
            onTap: _launchUrl,
          ),
        ),
        Divider(height: 30),
        Card(
          elevation: 10,
          color: Colors.white,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: ListTile(
            textColor: Colors.black,
            iconColor: Colors.green,
            leading: Icon(Icons.question_answer, size: 50),
            title: Text(
              '¿Quiénes somos?',
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: titleStyle,
            ),
            subtitle: Text(
              '¿Deseas saber más sobre nosotros y nuestro proyecto?',
              textScaleFactor: 1.2,
              textAlign: TextAlign.justify,
              style: subtitleStyle,
            ),
            trailing: Icon(Icons.navigate_next, size: 50),
            onTap: () => _quienesSomosAlert(context),
          ),
        ),
      ],
    ));
  }

  _quienesSomosAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('¿Quiénes somos?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Image(
                  image: AssetImage('assets/images/logofarm.png'),
                  height: 100.0,
                ),
                Divider(),
                Text(
                    'Agrotech es un proyecto desarrollado para la detección de enfermedades en el cultivo de papa, haciendo uso de inteligencia artificial.'),
                Divider(),
                Text("Autores:"),
                ListTile(
                  title: Text('Anthony Quiranza'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Anthony.png'),
                  ),
                ),
                ListTile(
                  title: Text('Daniela Morán'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Daniela.png'),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.green),
                  )),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK', style: TextStyle(color: Colors.green)))
            ],
          );
        });
  }

  void _launchUrl() async {
    if (!await launchUrl(_videoURL)) throw 'No se puede abrir $_videoURL';
  }
}

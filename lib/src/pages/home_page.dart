// ignore_for_file: prefer_const_constructors

import 'package:detection/src/models/style_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Menú Principal'),
      //   elevation: 20,S
      //   toolbarTextStyle: TextStyle(fontWeight: FontWeight.w800),
      //   centerTitle: true,
      //   backgroundColor: Colors.green,
      // ),
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
            leading: Icon(Icons.question_mark, size: 50),
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
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/upec.svg'),
                  radius: 40,
                  backgroundColor: Colors.white,
                ),
                Text(
                    'Somos estudiantes de la Carrera de Computación de la Universidad Politécnica Estatal del Carchi'),
                ListTile(
                  title: Text('Contáctanos'),
                  leading: Icon(Icons.contact_mail),
                ),
                ListTile(
                  title: Text('Visítanos en nuestro sitio web'),
                  leading: Icon(Icons.web),
                )
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
}

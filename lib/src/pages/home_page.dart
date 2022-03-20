// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
        elevation: 20,
        toolbarTextStyle: TextStyle(fontWeight: FontWeight.w800),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: _menuList(context),
    );
  }

  Widget _menuList(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        ListTile(
          textColor: Colors.black,
          iconColor: Colors.green,
          leading: Icon(Icons.camera, size: 50),
          title: Text('Detectar'),
          subtitle: Text('Utiliza tu cámara para empezar con la detección'),
          trailing: Icon(Icons.navigate_next, size: 50),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          height: 20,
          color: Colors.green,
        ),
        ListTile(
          textColor: Colors.black,
          iconColor: Colors.green,
          leading: Icon(Icons.image_search_rounded, size: 50),
          title: Text('Usar galería'),
          subtitle: Text('Realiza una detección desde tu galería'),
          trailing: Icon(Icons.navigate_next, size: 50),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          height: 20,
          color: Colors.green,
        ),
        ListTile(
          textColor: Colors.black,
          iconColor: Colors.green,
          leading: Icon(Icons.question_mark, size: 50),
          title: Text('¿Quiénes somos?'),
          subtitle:
              Text('¿Deseas saber más sobre nosotros y nuestro proyecto?'),
          trailing: Icon(Icons.navigate_next, size: 50),
          onTap: () => _quienesSomosAlert(context),
        ),
        Divider(
          thickness: 1,
          height: 20,
          color: Colors.green,
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
                  backgroundImage: NetworkImage(
                      'https://krugercorp.com/wp-content/uploads/2022/02/KRUGER-icon-naranja-03.png'),
                  radius: 40,
                  backgroundColor: Colors.white,
                ),
                Text('Este es un proyecto en su versión Beta 0.2'),
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

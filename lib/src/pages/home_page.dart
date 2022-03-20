// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: _menuList(),
    );
  }

  Widget _menuList() {
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
          onTap: () {},
        ),
      ],
    ));
  }
}

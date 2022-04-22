import 'package:flutter/material.dart';

resultAlert(BuildContext context, String url, String disease) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        var titleStyle;
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Resultado', style: titleStyle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                  margin: EdgeInsets.all(8.0),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/jar-loading.gif'),
                    image: NetworkImage(url),
                    fadeInDuration: Duration(milliseconds: 200),
                    height: 300.0,
                    fit: BoxFit.cover,
                  )),
              Text('Las enfermedades encontradas son:'),
              Text(
                disease,
                textScaleFactor: 1.3,
                style: titleStyle,
              )
            ],
          ),
          actions: [
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close),
                label: Text('Cerrar'))
          ],
        );
      });
}

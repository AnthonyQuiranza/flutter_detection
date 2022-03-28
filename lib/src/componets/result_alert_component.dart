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
          title: Text('Resultado', style: TextStyle(color: Colors.green)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                margin: EdgeInsets.all(8.0),
                child: Image.network(url),
              ),
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

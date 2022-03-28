import 'package:flutter/material.dart';

resultAlert(BuildContext context, String url) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Resultado', style: TextStyle(color: Colors.green)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Image.network(url),
              Text('Las enfermedades encontradas son:'),
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

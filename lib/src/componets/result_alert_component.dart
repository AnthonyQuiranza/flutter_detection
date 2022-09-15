import 'package:flutter/material.dart';

resultAlert(BuildContext context, String url, String disease) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        var titleStyle;
        if (disease.contains("Lancha")) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
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
                  onPressed: () => Navigator.pushNamed(context, 'lancha'),
                  icon: Icon(Icons.info_sharp),
                  label: Text('Información')),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close),
                  label: Text('Cerrar'))
            ],
          );
        } else if (disease.contains("Septoria")) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
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
                  onPressed: () => Navigator.pushNamed(context, 'septoria'),
                  icon: Icon(Icons.info_sharp),
                  label: Text('Información')),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close),
                  label: Text('Cerrar'))
            ],
          );
        } else {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
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
        }
      });
}

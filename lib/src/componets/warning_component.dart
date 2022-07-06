import 'package:flutter/material.dart';

internetAlert(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      duration: Duration(seconds: 10),
      content: Text(
        "Necesitas conectarte a internet, por favor revisa tu conexión.",
        style: TextStyle(fontSize: 20.0),
      ),
    ),
  );
}

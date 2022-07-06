import 'package:detection/src/models/internet_model.dart';
import 'package:detection/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final internetChecker = CheckInternetConnection();

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}

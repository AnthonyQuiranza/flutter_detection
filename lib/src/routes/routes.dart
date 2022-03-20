import 'package:detection/src/pages/camera_page.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'camera': (BuildContext context) => CameraPage(),
  };
}

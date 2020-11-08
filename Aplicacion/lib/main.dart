import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/screens/lista.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Lista(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Roboto",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

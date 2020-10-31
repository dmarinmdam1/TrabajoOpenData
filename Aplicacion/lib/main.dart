import 'package:aplicacion/screens/barraNavegacion.dart';
import 'package:aplicacion/screens/googleMap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, home: Navegacion(), // MapSample(),
    );
  }
}
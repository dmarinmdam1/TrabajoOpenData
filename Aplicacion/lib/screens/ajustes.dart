import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/screens/barraNavegacion.dart';

class Ajustes extends StatefulWidget {
  @override
  _AjustesState createState() => _AjustesState();
}

class _AjustesState extends State<Ajustes> {
  Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    print("args:" + args.toString());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.offAll(Navegacion(), arguments: args);
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
        title: Center(
          child: Text(
            "Ajustes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Ajustes",
        ),
      ),
    );
  }
}

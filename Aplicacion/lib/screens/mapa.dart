import 'package:aplicacion/screens/ajustes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/mapaGoogle.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();

  static final String nombre = "mapa";
}

class _MapaState extends State<Mapa> {
  Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Mapa",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  args["desdePantalla"] = Mapa.nombre;
                  //args["ultimoPunto"] =
                  Get.offAll(Ajustes(), arguments: args);
                },
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: MapaGoogle(),
    );
  }
}

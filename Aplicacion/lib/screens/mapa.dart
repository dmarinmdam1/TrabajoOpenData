import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/models/mapaGoogle.dart';
import 'package:aplicacion/screens/ajustes.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
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
                Get.to(Ajustes());
              },
              child: Icon(
                Icons.settings,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: MapaGoogle(),
    );
  }
}

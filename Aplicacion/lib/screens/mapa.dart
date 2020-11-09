import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/models/drawer.dart';
import 'package:aplicacion/models/mapaGoogle.dart';
import 'package:aplicacion/screens/ajustes.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  Map<String, Object> args = new Map<String, Object>();
  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      drawer: args["fromLista"] == true ? null : DrawerWidget(),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Mapa",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: args["fromLista"] == true
            ? null
            : <Widget>[
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

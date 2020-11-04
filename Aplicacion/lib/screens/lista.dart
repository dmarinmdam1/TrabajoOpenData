import 'package:aplicacion/screens/ajustes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();

  static final String nombre = "lista";
}

class _ListaState extends State<Lista> {
  Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Lista",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  args["desdePantalla"] = Lista.nombre;
                  Get.offAll(Ajustes(), arguments: args);
                },
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Center(
        child: Text(
          "Lista",
        ),
      ),
    );
  }
}

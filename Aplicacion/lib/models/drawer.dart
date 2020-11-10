import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/screens/lista_1_grupos.dart';
import 'package:aplicacion/screens/mapa.dart';
import 'package:aplicacion/screens/ajustes.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: drawerList(),
        ),
      ),
    );
  }

  List<Widget> drawerList() {
    List<Widget> retorno = new List<Widget>();

    retorno.add(
      new SizedBox(
        height: 95,
        child: new DrawerHeader(
          child: Text("Farmacias de Guardia", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
          decoration: BoxDecoration(
            color: Color.fromRGBO(160, 0, 160, 1),
          ),
        ),
      ),
    );

    retorno.add(
      new ListTile(
        title: Text(
          "Lista",
          style: TextStyle(fontSize: 20),
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
        onTap: () {
          Get.offAll(Lista1Grupos());
        },
      ),
    );

    retorno.add(
      new ListTile(
        title: Text(
          "Mapa",
          style: TextStyle(fontSize: 20),
        ),
        leading: const Icon(
          Icons.location_on,
          color: Colors.black,
          size: 30,
        ),
        onTap: () {
          Get.offAll(Mapa(null));
        },
      ),
    );

    retorno.add(
      new ListTile(
        title: Text(
          "Ajustes",
          style: TextStyle(fontSize: 20),
        ),
        leading: const Icon(
          Icons.settings,
          color: Colors.black,
          size: 30,
        ),
        onTap: () {
          Get.to(Ajustes());
        },
      ),
    );

    return retorno;
  }
}

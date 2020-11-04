import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/screens/lista.dart';
import 'package:aplicacion/screens/mapa.dart';
import 'package:aplicacion/screens/ajustes.dart';

class Navegacion extends StatefulWidget {
  @override
  _NavegacionState createState() => _NavegacionState();
}

class _NavegacionState extends State<Navegacion> {
  Map<String, Object> args = new Map<String, Object>();

  int _pantallaActual = 1; // Mapa
  int _prePantallaActual = 1;

  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    // hacer if raro para settear "_pantallaActual" y
    // comprobar si es distinto a "_prePantallaActual"
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _pantallaActual != 0,
            child: TickerMode(
              enabled: _pantallaActual == 0,
              child: MaterialApp(
                home: Lista(),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  fontFamily: "Roboto",
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _pantallaActual != 1,
            child: TickerMode(
              enabled: _pantallaActual == 1,
              child: MaterialApp(
                home: Mapa(),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  fontFamily: "Roboto",
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _pantallaActual != 2,
            child: TickerMode(
              enabled: _pantallaActual == 2,
              child: MaterialApp(
                home: Ajustes(),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  fontFamily: "Roboto",
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pantallaActual,
        onTap: (int nuevaPantalla) {
          setState(() {
            this._pantallaActual = nuevaPantalla;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text("Lista"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text("Mapa"),
          ),
        ],
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
      ),
    );
  }
}

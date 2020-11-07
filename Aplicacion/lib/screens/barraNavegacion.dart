import 'package:flutter/material.dart';

import 'package:aplicacion/screens/lista.dart';
import 'package:aplicacion/screens/mapa.dart';
import 'package:aplicacion/screens/ajustes.dart';

class BarraNavegacion extends StatefulWidget {
  @override
  _BarraNavegacionState createState() => _BarraNavegacionState();

  void cambiarPantalla(int nuevaPantalla) {
    _BarraNavegacionState().cambiarPantalla(nuevaPantalla);
  }
}

class _BarraNavegacionState extends State<BarraNavegacion> {
  // Map<String, Object> args = new Map<String, Object>();

  int _pantallaActual = 1; // Mapa

  void cambiarPantalla(int nuevaPantalla) {
    setState(() {
      _pantallaActual = nuevaPantalla;
    });
  }

  @override
  Widget build(BuildContext context) {
    // args = Get.arguments ?? new Map<String, Object>();
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
          cambiarPantalla(nuevaPantalla);
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

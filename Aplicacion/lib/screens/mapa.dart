import 'package:flutter/material.dart';

import '../models/mapaGoogle.dart';

class Mapa extends StatelessWidget {
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
      ),
      body: MapaGoogle(),
    );
  }
}

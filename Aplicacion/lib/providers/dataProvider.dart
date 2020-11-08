import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:aplicacion/models/farmaciaDeGuardia.dart';
import 'package:aplicacion/models/farmacias.dart';

class DataProvider {
  static List<FarmaciaDeGuardia> listaFarmacias = [];
  static List<FarmaciaDeGuardia> listaFarmaciasHoy = [];

  static List<String> contenidoBase() {
    final List<String> retorno = [];
    for (int i = 65; i < 91; i++) {
      retorno.add("Contenido Base - (" + String.fromCharCode(i) + (i - 64).toString() + ")");
    }
    return retorno;
  }

  static Future<List<FarmaciaDeGuardia>> cargarFarmacias() async {
    final String data = await rootBundle.loadString('data/farmaciasDeGuardia.json');
    final decodedData = json.decode(data);
    Farmacias farmacias = Farmacias.fromJsonList(decodedData);
    listaFarmacias = farmacias.lista;
    return listaFarmacias;
  }

  static Future<List<FarmaciaDeGuardia>> cargarFarmaciasHoy() async {
    if (listaFarmacias.length == 0) {
      await cargarFarmacias();
    }
    listaFarmaciasHoy = [];
    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(now);
    listaFarmacias.forEach((farmacia) {
      if (farmacia.fecha == formattedDate) {
        listaFarmaciasHoy.add(farmacia);
      }
    });
    return listaFarmaciasHoy;
  }
}

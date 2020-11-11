import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:aplicacion/models/farmaciaDeGuardia.dart';
import 'package:aplicacion/models/farmacias.dart';

class DataProvider {
  static List<FarmaciaDeGuardia> farmacias = [];
  static List<FarmaciaDeGuardia> farmaciasHoy = [];
  static List<FarmaciaDeGuardia> farmaciasFiltradas = [];

  static List<String> grupos = [];
  static List<String> localidades = [];

  static List<String> contenidoBase() {
    final List<String> retorno = [];
    for (int i = 65; i < 91; i++) {
      retorno.add("Contenido Base - (" + String.fromCharCode(i) + (i - 64).toString() + ")");
    }
    return retorno;
  }

  static Future<List<FarmaciaDeGuardia>> cargarFarmacias() async {
    if (farmacias.length == 0) {
      final String data = await rootBundle.loadString('data/farmaciasDeGuardia.json');
      final decodedData = json.decode(data);
      Farmacias f = Farmacias.fromJsonList(decodedData);
      farmacias = f.lista;
    }
    return farmacias;
  }

  static Future<List<String>> getGrupos() async {
    if (grupos.length == 0) {
      if (farmaciasHoy.length == 0) {
        await getFarmaciasHoy();
      }
      farmaciasHoy.forEach((farmacia) {
        if (!grupos.contains(farmacia.grupo)) {
          grupos.add(farmacia.grupo);
        }
      });
      grupos.sort((a, b) => a.toString().compareTo(b.toString()));
    }
    return grupos;
  }

  static Future<List<String>> getLocalidades(String grupo) async {
    if (farmaciasHoy.length == 0) {
      await getFarmaciasHoy();
    }
    localidades = [];
    farmaciasHoy.forEach((farmacia) {
      if (farmacia.grupo == grupo) {
        if (!localidades.contains(farmacia.localidad)) {
          localidades.add(farmacia.localidad);
        }
      }
    });
    localidades.sort((a, b) => a.toString().compareTo(b.toString()));

    return localidades;
  }

  static Future<List<FarmaciaDeGuardia>> getFarmaciasFiltradas(String grupo, String localidad) async {
    if (farmaciasHoy.length == 0) {
      await getFarmaciasHoy();
    }
    farmaciasFiltradas = [];
    farmaciasHoy.forEach((farmacia) {
      if (farmacia.grupo == grupo && farmacia.localidad == localidad) {
        farmaciasFiltradas.add(farmacia);
      }
    });

    return farmaciasFiltradas;
  }

  static Future<List<FarmaciaDeGuardia>> getFarmaciasHoy() async {
    if (farmacias.length == 0) {
      await cargarFarmacias();
    }
    if (farmaciasHoy.length == 0) {
      var now = new DateTime.now();
      var formatter = new DateFormat('dd/MM/yyyy');
      String formattedDate = formatter.format(now);
      farmacias.forEach((farmacia) {
        if (farmacia.fecha == formattedDate) {
          farmaciasHoy.add(farmacia);
        }
      });
    }
    return farmaciasHoy;
  }
}

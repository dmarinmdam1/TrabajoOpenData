import 'package:aplicacion/models/mapaGoogle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/models/farmaciaDeGuardia.dart';
import 'package:aplicacion/screens/mapa.dart';
import 'package:aplicacion/providers/dataProvider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Lista3Farmacias extends StatefulWidget {
  @override
  _Lista3FarmaciasState createState() => _Lista3FarmaciasState();
}

class _Lista3FarmaciasState extends State<Lista3Farmacias> {
  Map<String, Object> args = new Map<String, Object>();
  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Seleccione una Farmacia",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: _cargandoElementosLista(args["grupo"], args["localidad"]),
    );
  }

  Widget _cargandoElementosLista(String grupo, String localidad) {
    return FutureBuilder(
      future: DataProvider.getFarmaciasFiltradas(grupo, localidad),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _elementosLista(snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _elementosLista(List<FarmaciaDeGuardia> farmaciasFiltradas) {
    final List<Widget> retorno = [];
    retorno.add(SizedBox(
      height: 2.0,
    ));
    retorno.add(Divider(
      color: Colors.black,
      thickness: 2,
      height: 0,
    ));
    farmaciasFiltradas.forEach((farmacia) {
      final elementoLista = GestureDetector(
        onTap: () async {
          //List<Location> coordenadas = await locationFromAddress(farmacia.direccin);
          //GetStorage().write("ultimasCoordenadas", coordenadas.first);
          args["fromLista"] = true;
          await MapaGoogle.setCurrentLocationAndZoom(LatLng(42.825541, -1.632107 /*coordenadas.first.latitude, coordenadas.first.longitude*/), 16.0);
          Get.to(Mapa(), arguments: args);
        },
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: farmacia.farmacia.substring(farmacia.farmacia.indexOf(",") + 2), style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                    TextSpan(text: " " + farmacia.farmacia.substring(0, farmacia.farmacia.indexOf(",")), style: TextStyle(fontSize: 20.0)),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Grupo: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: farmacia.grupo),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Localidad: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: farmacia.localidad),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Dirección: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: farmacia.direccin),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Horario: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    //TextSpan(text: element.desde.toString() + ":00 - " + element.hasta.toString() + ":00"),
                    TextSpan(text: (farmacia.desde == farmacia.hasta) ? "24h desde las " + farmacia.desde.toString() + ":00" : farmacia.desde.toString() + ":00 - " + farmacia.hasta.toString() + ":00"),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Teléfono: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: farmacia.telfono),
                  ]),
                ),
              ),
            ],
          ),
        ),
      );
      retorno.add(elementoLista);
      retorno.add(Divider(
        color: Colors.black,
        thickness: 2,
        height: 0,
      ));
    });
    retorno.add(SizedBox(
      height: 0.1,
    ));
    return retorno;
  }
}

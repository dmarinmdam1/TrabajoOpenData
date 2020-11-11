import 'package:aplicacion/models/farmaciaDeGuardia.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latlong/latlong.dart';

import 'package:aplicacion/models/drawer.dart';
import 'package:aplicacion/models/mapaFlutter.dart';
import 'package:aplicacion/screens/ajustes.dart';

class Mapa extends StatefulWidget {
  FarmaciaDeGuardia farmaciaDeGuardia;

  Mapa(this.farmaciaDeGuardia);

  @override
  _MapaState createState() => _MapaState(farmaciaDeGuardia);
}

class _MapaState extends State<Mapa> {
  FarmaciaDeGuardia farmaciaDeGuardia;

  _MapaState(this.farmaciaDeGuardia);

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
      body: farmaciaDeGuardia == null
          ? MapaFlutter(args["fromLista"] == true
              ? args["coordenadas"]
              : GetStorage().read("ultimasCoordenadas") == null
                  ? null
                  : LatLng(GetStorage().read("ultimasCoordenadas")[0], GetStorage().read("ultimasCoordenadas")[1]))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 2,
                        height: 0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
                        child: Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text.rich(
                              TextSpan(children: <TextSpan>[
                                TextSpan(text: farmaciaDeGuardia.farmacia.substring(farmaciaDeGuardia.farmacia.indexOf(",") + 2), style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                                TextSpan(text: " " + farmaciaDeGuardia.farmacia.substring(0, farmaciaDeGuardia.farmacia.indexOf(",")), style: TextStyle(fontSize: 20.0)),
                              ]),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                        child: Text.rich(
                          TextSpan(children: <TextSpan>[
                            TextSpan(text: "Grupo: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: farmaciaDeGuardia.grupo),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                        child: Text.rich(
                          TextSpan(children: <TextSpan>[
                            TextSpan(text: "Localidad: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: farmaciaDeGuardia.localidad),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                        child: Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text.rich(
                              TextSpan(children: <TextSpan>[
                                TextSpan(text: "Dirección: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: farmaciaDeGuardia.direccin),
                              ]),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                        child: Text.rich(
                          TextSpan(children: <TextSpan>[
                            TextSpan(text: "Horario: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            //TextSpan(text: element.desde.toString() + ":00 - " + element.hasta.toString() + ":00"),
                            TextSpan(text: (farmaciaDeGuardia.desde == farmaciaDeGuardia.hasta) ? "24h desde las " + farmaciaDeGuardia.desde.toString() + ":00" : farmaciaDeGuardia.desde.toString() + ":00 - " + farmaciaDeGuardia.hasta.toString() + ":00"),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                        child: Text.rich(
                          TextSpan(children: <TextSpan>[
                            TextSpan(text: "Teléfono: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: farmaciaDeGuardia.telfono),
                          ]),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 2,
                        height: 0,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 24 - 163 - 2,
                  child: MapaFlutter(args["fromLista"] == true
                      ? args["coordenadas"]
                      : GetStorage().read("ultimasCoordenadas") == null
                          ? null
                          : LatLng(GetStorage().read("ultimasCoordenadas")[0], GetStorage().read("ultimasCoordenadas")[1])),
                ),
              ],
            ),
    );
  }
}

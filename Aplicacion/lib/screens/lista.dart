import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/models/drawer.dart';
import 'package:aplicacion/screens/mapa.dart';
import 'package:aplicacion/screens/ajustes.dart';
import 'package:aplicacion/providers/dataProvider.dart';
import 'package:aplicacion/models/farmaciaDeGuardia.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
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
      body: _cargandoElementosLista(),
    );
  }

  Widget _cargandoElementosLista() {
    return FutureBuilder(
      future: DataProvider.cargarFarmaciasHoy(),
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

  List<Widget> _elementosLista(List<FarmaciaDeGuardia> data) {
    final List<Widget> retorno = [];
    retorno.add(SizedBox(
      height: 2.0,
    ));
    retorno.add(Divider(
      color: Colors.black,
      thickness: 2,
      height: 0,
    ));
    data.forEach((element) {
      final elementoLista = GestureDetector(
        onTap: () {
          Get.to(Mapa());
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
                    TextSpan(text: element.farmacia.substring(element.farmacia.indexOf(",") + 2), style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                    TextSpan(text: " " + element.farmacia.substring(0, element.farmacia.indexOf(",")), style: TextStyle(fontSize: 20.0)),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Grupo: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: element.grupo),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Localidad: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: element.localidad),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Dirección: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: element.direccin),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Horario: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    //TextSpan(text: element.desde.toString() + ":00 - " + element.hasta.toString() + ":00"),
                    TextSpan(text: (element.desde == element.hasta) ? "24h desde las " + element.desde.toString() + ":00" : element.desde.toString() + ":00 - " + element.hasta.toString() + ":00"),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Teléfono: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: element.telfono),
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

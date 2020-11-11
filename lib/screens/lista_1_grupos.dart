import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/models/drawer.dart';
import 'package:aplicacion/screens/lista_2_localidades.dart';
import 'package:aplicacion/screens/ajustes.dart';
import 'package:aplicacion/providers/dataProvider.dart';
import 'package:get_storage/get_storage.dart';

class Lista1Grupos extends StatefulWidget {
  @override
  _Lista1GruposState createState() => _Lista1GruposState();
}

class _Lista1GruposState extends State<Lista1Grupos> {
  Map<String, Object> args = new Map<String, Object>();
  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Seleccione un Grupo",
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
      future: DataProvider.getGrupos(),
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

  List<Widget> _elementosLista(List<String> grupos) {
    final List<Widget> retorno = [];
    retorno.add(SizedBox(
      height: 2.0,
    ));
    retorno.add(Divider(
      color: Colors.black,
      thickness: 2,
      height: 0,
    ));
    grupos.forEach((grupo) {
      final elementoLista = GestureDetector(
        onTap: () {
          GetStorage().write("ultimoGrupo", grupo);
          args["grupo"] = grupo;
          Get.to(Lista2Localidades(), arguments: args).then((value) {
            setState(() {});
          });
        },
        child: Container(
          color: GetStorage().read("ultimoGrupo") == grupo ? Colors.green[100] : Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                child: Icon(
                  Icons.location_on,
                  size: 24.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width * 0.888888,
                child: Text(grupo, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
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

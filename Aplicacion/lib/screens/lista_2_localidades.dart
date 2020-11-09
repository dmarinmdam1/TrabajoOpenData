import 'package:aplicacion/screens/lista_3_farmacias.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/providers/dataProvider.dart';
import 'package:get_storage/get_storage.dart';

class Lista2Localidades extends StatefulWidget {
  @override
  _Lista2LocalidadesState createState() => _Lista2LocalidadesState();
}

class _Lista2LocalidadesState extends State<Lista2Localidades> {
  Map<String, Object> args = new Map<String, Object>();
  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Seleccione una Localidad",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: _cargandoElementosLista(args["grupo"]),
    );
  }

  Widget _cargandoElementosLista(String grupo) {
    return FutureBuilder(
      future: DataProvider.getLocalidades(grupo),
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

  List<Widget> _elementosLista(List<String> localidades) {
    final List<Widget> retorno = [];
    retorno.add(SizedBox(
      height: 2.0,
    ));
    retorno.add(Divider(
      color: Colors.black,
      thickness: 2,
      height: 0,
    ));
    localidades.forEach((localidad) {
      final elementoLista = GestureDetector(
        onTap: () {
          GetStorage().write("ultimaLocalidad", localidad);
          args["localidad"] = localidad;
          Get.to(Lista3Farmacias(), arguments: args);
        },
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
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
                child: Text(localidad, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
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

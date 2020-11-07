import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aplicacion/screens/ajustes.dart';
import 'package:aplicacion/providers/dataProvider.dart';
import 'package:aplicacion/screens/barraNavegacion.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: _elementosLista(),
      ),
    );
  }

  List<Widget> _elementosLista() {
    List<Widget> retorno = new List<Widget>();
    retorno.add(SizedBox(
      height: 2.0,
    ));
    retorno.add(Divider(
      color: Colors.black,
      thickness: 2,
      height: 0,
    ));
    DataProvider.contenidoBase().forEach((element) {
      final nombre = "Maria del Mar Goyache Sainz de Vicuña";
      final grupo = "Etxarri-Aranatz, Irurtzun, Leitza, Ultzama";
      final localidad = "OLAZTI/OLAZAGUTIA";
      final direccion = "C/ Albistur, 39 G. Próxima al Centro Salud";
      final horario = "9:00 - 21:00";
      final telefono = "948 503365";

      final elementoLista = GestureDetector(
        onTap: () {
          BarraNavegacion().cambiarPantalla(1);
        },
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
                child: Text(
                  nombre.length > 30 ? nombre.substring(0, 31) + "..." : nombre,
                  //nombre,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Grupo: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: grupo),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Localidad: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: localidad),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Dirección: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: direccion),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Horario: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: horario),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Teléfono: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: telefono),
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

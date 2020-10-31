import 'package:aplicacion/providers/dataProvider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farmacias de Guardia en Navarra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.block),
            SizedBox(
              width: 15.0,
            ),
            Text("Base"),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: _base(DataProvider.contenidoBase()),
        ),
      ),
    );
  }

  List<Widget> _base(List<String> contenidoBase) {
    List<Widget> retorno = new List<Widget>();
    contenidoBase.forEach((element) {
      final tile = new ListTile(
        title: Center(child: Text(element)),
      );
      retorno.add(tile);
      retorno.add(Divider());
    });
    return retorno;
  }
}

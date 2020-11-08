import 'farmaciaDeGuardia.dart';

class Farmacias {
  List<FarmaciaDeGuardia> lista = new List();

  Farmacias.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((element) {
      final FarmaciaDeGuardia fdg = FarmaciaDeGuardia.fromJson(element);
      lista.add(fdg);
    });
  }
}

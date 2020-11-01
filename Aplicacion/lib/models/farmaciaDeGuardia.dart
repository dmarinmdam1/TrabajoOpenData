import 'dart:convert';

FarmaciaDeGuardia farmaciaDeGuardiaFromJson(String str) => FarmaciaDeGuardia.fromJson(json.decode(str));

String farmaciaDeGuardiaToJson(FarmaciaDeGuardia data) => json.encode(data.toJson());

class FarmaciaDeGuardia {
  String fecha;
  int desde;
  int hasta;
  String localidad;
  String grupo;
  String direccin;
  String farmacia;
  String codFarmacia;
  String telfono;

  FarmaciaDeGuardia({
    this.fecha,
    this.desde,
    this.hasta,
    this.localidad,
    this.grupo,
    this.direccin,
    this.farmacia,
    this.codFarmacia,
    this.telfono,
  });

  factory FarmaciaDeGuardia.fromJson(Map<String, dynamic> json) => FarmaciaDeGuardia(
        fecha: json["FECHA"],
        desde: json["DESDE"],
        hasta: json["HASTA"],
        localidad: json["LOCALIDAD"],
        grupo: json["GRUPO"],
        direccin: json["DIRECCIÓN"],
        farmacia: json["FARMACIA"],
        codFarmacia: json["Cod_FARMACIA"],
        telfono: json["TELÉFONO"],
      );

  Map<String, dynamic> toJson() => {
        "FECHA": fecha,
        "DESDE": desde,
        "HASTA": hasta,
        "LOCALIDAD": localidad,
        "GRUPO": grupo,
        "DIRECCIÓN": direccin,
        "FARMACIA": farmacia,
        "Cod_FARMACIA": codFarmacia,
        "TELÉFONO": telfono,
      };
}

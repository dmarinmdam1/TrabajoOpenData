import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaGoogle extends StatefulWidget {
  @override
  State<MapaGoogle> createState() => _MapaGoogleState();
}

class _MapaGoogleState extends State<MapaGoogle> {
  static final CameraPosition _ubicacionInicial = CameraPosition(
    target: LatLng(42.811512, -1.640840),
    zoom: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _ubicacionInicial,
    );
  }
}

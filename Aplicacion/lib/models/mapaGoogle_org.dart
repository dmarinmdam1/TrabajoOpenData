/*import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaGoogle extends StatefulWidget {
  static Future<void> setCurrentLocationAndZoom(LatLng nuevaLocalizacion, double nuevoZoom) async {
    _MapaGoogleState.setCurrentLocationAndZoom(nuevaLocalizacion, nuevoZoom);
  }

  @override
  State<MapaGoogle> createState() => _MapaGoogleState();
}

class _MapaGoogleState extends State<MapaGoogle> {
  static Completer<GoogleMapController> _controller = Completer();

  static LatLng _actualLocalizacion;
  static double _actualZoom;

  static Future<void> setCurrentLocationAndZoom(LatLng nuevaLocalizacion, double nuevoZoom) async {
    _actualLocalizacion = nuevaLocalizacion;
    _actualZoom = nuevoZoom;
    final GoogleMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _actualLocalizacion /*, zoom: _actualZoom*/)));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        if (!_controller.isCompleted) _controller.complete(controller);
      },
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(40.416782, -3.703719),
        zoom: 16.0,
      ),
      /*
      onCameraMove: (value) {
        setState(() {
          _actualZoom = value.zoom;
          _actualLocalizacion = value.target;
        });
      },*/
    );
  }
}*/

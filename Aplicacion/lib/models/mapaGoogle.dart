import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaGoogle extends StatefulWidget {
  @override
  State<MapaGoogle> createState() => _MapaGoogleState();

  static LatLng getCurrentLocation() {
    return _MapaGoogleState.getCurrentLocation();
  }

  static Future<void> setCurrentLocation(LatLng nuevaLocalizacion) async {
    _MapaGoogleState.setCurrentLocation(nuevaLocalizacion);
  }

  static double getCurrentZoom() {
    return _MapaGoogleState.getCurrentZoom();
  }

  static Future<void> setCurrentZoom(double nuevoZoom) async {
    _MapaGoogleState.setCurrentZoom(nuevoZoom);
  }
}

class _MapaGoogleState extends State<MapaGoogle> {
  static Completer<GoogleMapController> _controller = Completer();

  static LatLng _actualLocalizacion;
  static double _actualZoom;

  static LatLng getCurrentLocation() {
    return _actualLocalizacion;
  }

  static Future<void> setCurrentLocation(LatLng nuevaLocalizacion) async {
    _actualLocalizacion = nuevaLocalizacion;
    final GoogleMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _actualLocalizacion)));
  }

  static double getCurrentZoom() {
    return _actualZoom;
  }

  static Future<void> setCurrentZoom(double nuevoZoom) async {
    _actualZoom = nuevoZoom;
    final GoogleMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.newLatLngZoom(_actualLocalizacion, _actualZoom));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        if (!_controller.isCompleted) _controller.complete(controller);
      },
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(42.825541, -1.632107),
        zoom: 16.0,
      ),
      onCameraMove: (value) {
        setState(() {
          _actualZoom = value.zoom;
          _actualLocalizacion = value.target;
        });
      },
    );
  }
}

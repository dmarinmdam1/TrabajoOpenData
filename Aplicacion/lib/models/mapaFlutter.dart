import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapaFlutter extends StatefulWidget {
  final LatLng localizacionYMarker;

  MapaFlutter(this.localizacionYMarker);

  @override
  State<MapaFlutter> createState() => _MapaFlutterState(localizacionYMarker);
}

class _MapaFlutterState extends State<MapaFlutter> {
  LatLng localizacionYMarker;

  _MapaFlutterState(this.localizacionYMarker);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: localizacionYMarker == null ? LatLng(42.818401, -1.644114) : localizacionYMarker,
        zoom: 17.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': 'pk.eyJ1IjoibXJzYW1pc2FjayIsImEiOiJja2hjY2ZobjQwZDExMnFuZ3dsd205ZWJvIn0.xWJ3xGNJ3oYnhYC3E2IRFA',
            'id': 'mapbox.streets',
          },
        ),
        localizacionYMarker == null
            ? MarkerLayerOptions()
            : MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 30.0,
                    height: 30.0,
                    point: localizacionYMarker,
                    builder: (ctx) => Container(
                      child: Image(
                        image: AssetImage("assets/images/iconoFarmacia.png"),
                        color: null,
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}

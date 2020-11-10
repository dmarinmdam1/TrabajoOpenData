import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapaFlutter extends StatefulWidget {
  @override
  State<MapaFlutter> createState() => _MapaFlutterState();
}

class _MapaFlutterState extends State<MapaFlutter> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(42.825537, -1.632080),
        zoom: 16.0,
      ),
      layers: [
        TileLayerOptions(urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", subdomains: [
          'a',
          'b',
          'c'
        ]),
        MarkerLayerOptions(
          markers: [
            /*
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(42.825541, -1.632107),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.add_box_outlined,
                  color: Colors.blue,
                  size: 50.0,
                ),
              ),
            ),
          */
          ],
        ),
      ],
    );
  }
}

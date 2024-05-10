import 'package:energise_test/models/ip_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDisplay extends StatelessWidget {
  final IpInfo ipInfo;

  const MapDisplay({super.key, required this.ipInfo});
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(ipInfo.lat, ipInfo.lon),
          initialZoom: 13.0,
          
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          )
        ]);
  }
}

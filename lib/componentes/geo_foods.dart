import 'package:app/providers/geolocator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeoFoods extends StatefulWidget {
  final void Function(String) onLocationChanged;
  const GeoFoods({super.key, required this.onLocationChanged});

  @override
  State<GeoFoods> createState() => _GeoFoodsState();
}

class _GeoFoodsState extends State<GeoFoods> {
  @override
  Widget build(BuildContext context) {
    final local = context.watch<GeolocatorProvider>();
    String address = '';
    if (local.lat != 0.0 && local.long != 0.0) {
      address = local.address;
      widget.onLocationChanged(address);
    } else {
      address = 'Obtendo localização...';
    }

    return SizedBox(
      child: Center(
        child: Text(address),
      ),
    );
  }
}

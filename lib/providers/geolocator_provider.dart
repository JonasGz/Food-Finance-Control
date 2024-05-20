import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorProvider extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  List<Placemark> placemarks = [];
  String street = '';
  String country = '';
  String cep = '';
  String admArea = '';
  String address = '';

  GeolocatorProvider() {
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      placemarks = await placemarkFromCoordinates(lat, long);
      street = placemarks.reversed.last.street!;
      admArea = placemarks.reversed.last.administrativeArea!;

      address = '$street, '
          '$admArea';
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error("Por favor habilite a localização no seu celular!");
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error("Você precisa autorizar o acesso a localização");
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error("Você precisa autorizar o acesso a localização");
    }

    return await Geolocator.getCurrentPosition();
  }
}

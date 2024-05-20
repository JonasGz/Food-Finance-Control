import 'package:flutter/material.dart';

import '../models/model.dart';

class FoodsProvider extends ChangeNotifier {
  List<Comidas>? comidas = [];

  void addFood(Comidas foods) {
    comidas?.add(foods);
    notifyListeners();
  }

  void removeFood(Comidas foods) {
    comidas?.remove(foods);
    notifyListeners();
  }
}

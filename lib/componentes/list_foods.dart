import 'package:app/models/model.dart';
import 'package:app/providers/foods_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/componentes/list_foods_tile.dart';
import 'package:provider/provider.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final foodsProvider = context.watch<FoodsProvider>();
    final List<Comidas>? listaComidas = foodsProvider.comidas;

    if (listaComidas == null || listaComidas.isEmpty) {
      return const Center(child: Text("ERROR"));
    } else {
      return SizedBox(
        child: Center(
          child: ListView.builder(
            itemCount: listaComidas.length,
            itemBuilder: (context, index) {
              Comidas foods = listaComidas[index];
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListFoodsTile(foods),
              );
            },
          ),
        ),
      );
    }
  }
}

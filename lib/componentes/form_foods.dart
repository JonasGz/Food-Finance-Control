import 'package:app/models/model.dart';
import 'package:app/providers/foods_provider.dart';
import 'package:app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'geo_foods.dart';

class FoodForm extends StatefulWidget {
  const FoodForm({super.key});

  @override
  State<FoodForm> createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  final nomeController = TextEditingController();

  final valorTotalController = TextEditingController();

  final quantidadeController = TextEditingController();

  String address = 'Obtendo Localização..';
  double latitude = 0;
  double longitude = 0;

  @override
  Widget build(BuildContext context) {
    final foodsProvider = context.watch<FoodsProvider>();
    final addFood = foodsProvider.addFood;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: const Color(0xFF1A2023),
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 30.0),
          width: screenWidth * 0.8,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1A1E20).withOpacity(1),
                        spreadRadius: 1,
                        blurRadius: 2,
                      )
                    ]),
                child: const Icon(
                  Icons.lunch_dining_rounded,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lunch_dining),
                    hintText: 'Pizza',
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: valorTotalController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.attach_money_rounded),
                    hintText: '20.00',
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: quantidadeController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.numbers_rounded),
                    hintText: '2',
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              GeoFoods(
                onLocationChanged: (loc) {
                  address = loc;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: MaterialButton(
                  onPressed: () {
                    String nome = nomeController.text;
                    double valorTotal = double.parse(valorTotalController.text);
                    int quantComida = int.parse(quantidadeController.text);
                    DateTime datahora = DateTime.now().toLocal();
                    final foods = Comidas(
                        nome, valorTotal, quantComida, address, datahora);
                    addFood(foods);
                    Navigator.pushReplacementNamed(context, Routes.foods);
                  },
                  height: 80.0,
                  minWidth: 80.0,
                  color: Colors.black38,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: const Icon(
                    Icons.add,
                    size: 50.0,
                    color: Color(0xFFDF4243),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

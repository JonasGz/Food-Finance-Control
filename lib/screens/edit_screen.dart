import 'package:app/models/model.dart';
import 'package:app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/foods_provider.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final foods = ModalRoute.of(context)!.settings.arguments as Comidas;
    final nomeController = TextEditingController(text: foods.name.toString());
    final valorTotalController =
        TextEditingController(text: foods.valorTotal.toString());
    final quantidadeController =
        TextEditingController(text: foods.quantidadeComida.toString());
    final foodsProvider = context.watch<FoodsProvider>();
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1A2023),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDF4243),
        title: const Text(
          "Editar",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
      ),
      body: Container(
        color: const Color(0xFF1A2023),
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 10.0),
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
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Lanche',
                      prefixIcon: Icon(Icons.lunch_dining),
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
                      labelText: 'Valor',
                      prefixIcon: Icon(Icons.attach_money_rounded),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    controller: quantidadeController,
                    decoration: const InputDecoration(
                      labelText: 'Quantidade',
                      prefixIcon: Icon(Icons.numbers),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          foods.name = nomeController.text;
                          foods.valorTotal =
                              double.parse(valorTotalController.text);
                          foods.quantidadeComida =
                              int.parse(quantidadeController.text);

                          Navigator.popAndPushNamed(context, Routes.foods,
                              result: foods);
                        },
                        height: 80.0,
                        minWidth: 80.0,
                        color: Colors.black38,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: const Icon(
                          Icons.edit,
                          size: 40.0,
                          color: Color(0xFFDF4243),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          foodsProvider.removeFood(foods);
                          Navigator.pushReplacementNamed(context, Routes.foods);
                        },
                        height: 80.0,
                        minWidth: 80.0,
                        color: Colors.black38,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: const Icon(
                          Icons.delete_forever,
                          size: 50.0,
                          color: Color(0xFFDF4243),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

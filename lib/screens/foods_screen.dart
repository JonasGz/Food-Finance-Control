import 'package:app/componentes/list_foods.dart';
import 'package:flutter/material.dart';

class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key});

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2023),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDF4243),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.0),
        )),
        centerTitle: true,
        title: const Text(
          "Lanches consumidos",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const FoodList(),
    );
  }
}

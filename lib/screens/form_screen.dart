import 'package:app/componentes/form_foods.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2023),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDF4243),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.0),
        )),
        title: const Text(
          "Adicionar lanche",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const FoodForm(),
    );
  }
}

import 'package:app/routes.dart';
import 'package:flutter/material.dart';
import '../models/model.dart';

class ListFoodsTile extends StatefulWidget {
  const ListFoodsTile(
    this.foods, {
    super.key,
  });

  final Comidas foods;

  @override
  State<ListFoodsTile> createState() => _ListFoodsTileState();
}

class _ListFoodsTileState extends State<ListFoodsTile> {
  @override
  Widget build(BuildContext context) {
    String nome = widget.foods.name.toString();
    String valorTotal = widget.foods.valorTotal.toStringAsFixed(2);
    String quantComida = widget.foods.quantidadeComida.toStringAsFixed(2);
    String address = widget.foods.location;
    int dia = widget.foods.datahora.day;
    int mes = widget.foods.datahora.month;
    int ano = widget.foods.datahora.year;
    int hora = widget.foods.datahora.hour;
    int minutes = widget.foods.datahora.minute;
    int seconds = widget.foods.datahora.second;
    return Container(
      decoration: const BoxDecoration(color: Color(0xFF1A2023), boxShadow: [
        BoxShadow(
          color: Color(0xFF191F1F),
          spreadRadius: 2,
          blurRadius: 10,
        )
      ]),
      child: ListTile(
        leading: const Icon(
          Icons.food_bank_rounded,
          color: Colors.white,
          size: 60.0,
        ),
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.attach_money,
                color: Color(0xFFDF4243),
              ),
            ),
            Text(
              valorTotal,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(223, 255, 255, 255),
              ),
            ),
          ],
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.local_dining,
                    color: Color(0xFFDF4243),
                  ),
                ),
                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(223, 255, 255, 255),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.numbers,
                    color: Color(0xFFDF4243),
                  ),
                ),
                Text(
                  quantComida,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(223, 255, 255, 255),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.local_convenience_store_rounded,
                    color: Color(0xFFDF4243),
                  ),
                ),
                Text(
                  address,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(223, 255, 255, 255),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.date_range_rounded,
                    color: Color(0xFFDF4243),
                  ),
                ),
                Text(
                  '$dia/'
                  '$mes/'
                  '$ano -'
                  ' $hora h '
                  '$minutes min '
                  '$seconds seg',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(223, 255, 255, 255),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            )
          ],
        ),
        onTap: () async {
          final updateFoods = await Navigator.pushReplacementNamed(
            context,
            Routes.editfood,
            arguments: widget.foods,
          );
          if (updateFoods != null) {
            setState(() {
              widget.foods.valorTotal = (updateFoods as Comidas).valorTotal;
              widget.foods.quantidadeComida = updateFoods.quantidadeComida;
            });
          }
        },
      ),
    );
  }
}

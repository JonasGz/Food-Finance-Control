import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF1A2023),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDF4243),
        centerTitle: true,
        title: const Text(
          "Food Control Finance",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins-Regular',
          ),
        ).animate().fadeIn(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: widthDevice * 0.9,
          height: heightDevice * 0.8,
          decoration: BoxDecoration(
            color: const Color(0x0f50758a),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 260,
                      height: 260,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(200),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF1A1E20).withOpacity(1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 260,
                      height: 260,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    Image.asset(
                      'assets/imgs/foodhome.png',
                      width: 200,
                    )
                        .animate(
                          onPlay: (controller) => controller.repeat(),
                        )
                        .moveY(
                            begin: -25,
                            end: 15,
                            curve: Curves.easeInOut,
                            duration: 1000.ms)
                        .then()
                        .moveY(
                            begin: 15,
                            end: -25,
                            curve: Curves.easeInOut,
                            duration: 1000.ms),
                  ],
                ),
              ),
              const Text(
                'Bem-vindo (a)',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400),
              ).animate().fadeIn(duration: 2000.ms),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () => Navigator.pushNamed(context, Routes.foods),
                    height: 100.0,
                    minWidth: 100.0,
                    color: Colors.black38,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: const Icon(
                      Icons.list,
                      size: 50.0,
                      color: Color(0xFFDF4243),
                    ),
                  ).animate().shake(),
                  MaterialButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.insertfood),
                    height: 100.0,
                    minWidth: 100.0,
                    color: Colors.black38,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: const Icon(
                      Icons.add,
                      size: 50.0,
                      color: Color(0xFFDF4243),
                    ),
                  ).animate().shake(),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

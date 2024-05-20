import 'package:app/providers/foods_provider.dart';
import 'package:app/screens/foods_screen.dart';
import 'package:app/screens/form_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/geolocator_provider.dart';
import 'routes.dart';
import 'screens/edit_screen.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FoodsProvider>(
              create: (context) => FoodsProvider()),
          ChangeNotifierProvider<GeolocatorProvider>(
              create: (context) => GeolocatorProvider()),
        ],
        child: MaterialApp(
          title: 'App Foods',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          ),
          routes: {
            Routes.home: (context) => const HomeScreen(),
            Routes.foods: (context) => const FoodsScreen(),
            Routes.insertfood: (context) => const FormScreen(),
            Routes.editfood: (context) => const EditScreen(),
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty/screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF22A2BD)),
      ),
    );
  }
}

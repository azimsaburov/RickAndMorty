import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc/character_bloc.dart';
import 'package:rick_and_morty/home_screen.dart';
import 'package:rick_and_morty/theme_constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CharacterBloc())],
      child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeConstants.lightTheme,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/filter_cubit/filter_cubit.dart';

class CharacterFilterScreen extends StatefulWidget {
  const CharacterFilterScreen({super.key});

  @override
  State<CharacterFilterScreen> createState() => _CharacterFilterScreenState();
}

class _CharacterFilterScreenState extends State<CharacterFilterScreen> {
CharacterStatus? selectStatus;
Gender? selectGender;
FilterCubit get filterCubit => context.read<FilterCubit>();

@override
  void initState() {
selectGender = state.selectGender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
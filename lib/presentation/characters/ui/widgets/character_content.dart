import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/characters_models.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_grid_tile.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_list_tile.dart';

class CharacterContent extends StatelessWidget {
  final List<CharacterModel> characters;
  final bool isListView;
  const CharacterContent({
    super.key,
    required this.characters,
    required this.isListView,
  });

  @override
  Widget build(BuildContext context) {
    return isListView
        ? ListView.separated(
            itemCount: characters.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              return CharacterListTile(
                name: characters[index].name,
                gender: characters[index].gender,
                status: characters[index].status,
                species: characters[index].species,
                imageUrl: characters[index].image,
              );
            },
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 164 / 192,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
            ),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return CharacterGridTile(
                name: characters[index].name,
                gender: characters[index].gender,
                status: characters[index].status,
                species: characters[index].species,
                imageUrl: characters[index].image,
              );
            },
          );
  }
}

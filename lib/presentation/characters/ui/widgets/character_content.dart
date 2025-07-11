import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_grid_tile.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_list_tile.dart';

class CharacterContent extends StatelessWidget {
  final List<CharacterEntity> characters;
  final bool isListView;
  final ScrollController controller;
  final bool showLoadingIndicator;
  const CharacterContent({
    super.key,
    required this.characters,
    required this.isListView,
    required this.controller,
    this.showLoadingIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return isListView
        ? ListView.separated(
            controller: controller,
            itemCount: showLoadingIndicator
                ? characters.length + 1
                : characters.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (showLoadingIndicator && index >= characters.length) {
                return Center(child: CircularProgressIndicator());
              } else {
                return CharacterListTile(
                  name: characters[index].name,
                  gender: characters[index].gender,
                  status: characters[index].status,
                  species: characters[index].species,
                  imageUrl: characters[index].image,
                );
              }
            },
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 164 / 192,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
            ),
            controller: controller,
            itemCount: showLoadingIndicator
                ? characters.length + 1
                : characters.length,
            itemBuilder: (context, index) {
              if (showLoadingIndicator && index >= characters.length) {
                return Center(child: CircularProgressIndicator());
              } else {
                return CharacterGridTile(
                  name: characters[index].name,
                  gender: characters[index].gender,
                  status: characters[index].status,
                  species: characters[index].species,
                  imageUrl: characters[index].image,
                );
              }
            },
          );
  }
}

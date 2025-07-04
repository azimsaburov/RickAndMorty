import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/characters/characters_models.dart';
import 'package:rick_and_morty/features/characters/ui/character_list_tile.dart';

class CharacterContent extends StatefulWidget {
  final List<CharacterModel> characters;
  const CharacterContent({super.key, required this.characters});

  @override
  State<CharacterContent> createState() => _CharacterContentState();
}

class _CharacterContentState extends State<CharacterContent> {
  late bool isListView;
  @override
  void initState() {
    isListView = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isListView
        ? ListView.separated(
            itemCount: widget.characters.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              return CharacterListTile(
                name: widget.characters[index].name,
                gender: widget.characters[index].gender,
                status: widget.characters[index].status,
                species: widget.characters[index].species,
                imageUrl: widget.characters[index].image,
              );
            },
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: widget.characters.length,
            itemBuilder: (context, index) {
              return CharacterListTile(
                name: widget.characters[index].name,
                gender: widget.characters[index].gender,
                status: widget.characters[index].status,
                species: widget.characters[index].species,
                imageUrl: widget.characters[index].image,
              );
            },
          );
  }
}

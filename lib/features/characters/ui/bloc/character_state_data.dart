import 'package:rick_and_morty/data/models/characters/characters_models.dart';

class CharacterStateData {
  final List<CharacterModel> characters;

  CharacterStateData({required this.characters});

  const CharacterStateData.empty() : characters = const [];

  CharacterStateData copyWith({List<CharacterModel>? characters}) {
    return CharacterStateData(characters: characters ?? this.characters);
  }
}

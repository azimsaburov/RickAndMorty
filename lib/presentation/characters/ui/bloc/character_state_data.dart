import 'package:rick_and_morty/data/models/characters_models.dart';

class CharacterStateData {
  final List<CharacterModel> characters;
  final int totalCount;

  const CharacterStateData({required this.characters, this.totalCount = 0});

  const CharacterStateData.empty() : characters = const [], totalCount = 0;

  CharacterStateData copyWith({
    List<CharacterModel>? characters,
    int? totalCount,
  }) {
    return CharacterStateData(
      characters: characters ?? this.characters,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}

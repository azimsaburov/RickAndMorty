import 'package:rick_and_morty/domain/models/character_entity.dart';

class CharacterStateData {
  final List<CharacterEntity> characters;
  final int totalCount;

  const CharacterStateData({required this.characters, this.totalCount = 0});

  const CharacterStateData.empty() : characters = const [], totalCount = 0;

  CharacterStateData copyWith({
    List<CharacterEntity>? characters,
    int? totalCount,
  }) {
    return CharacterStateData(
      characters: characters ?? this.characters,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}

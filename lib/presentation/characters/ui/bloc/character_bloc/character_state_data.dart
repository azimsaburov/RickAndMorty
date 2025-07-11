import 'package:rick_and_morty/domain/models/character_entity.dart';

class CharacterStateData {
  final List<CharacterEntity> characters;
  final int totalCount;
  final int page;
  final bool hasNextPage;

  const CharacterStateData({
    required this.characters,
    this.totalCount = 0,
    this.page = 1,
    this.hasNextPage = false,
  });

  const CharacterStateData.empty()
    : characters = const [],
      totalCount = 0,
      page = 1,
      hasNextPage = false;

  CharacterStateData copyWith({
    List<CharacterEntity>? characters,
    int? totalCount,
    int? page,
    bool? hasNextPage,
  }) {
    return CharacterStateData(
      characters: characters ?? this.characters,
      totalCount: totalCount ?? this.totalCount,
      page: page ?? this.page,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}

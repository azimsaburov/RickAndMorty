import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/domain/models/paged_list_entity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getCharactersByIds(List<int> ids);
  Future<PagedListEntity<CharacterEntity>> getCharacters({
    int? page,
    String? name,
    CharacterStatus? characterStatus,
    Gender? gender,
  });
  Future<CharacterEntity> getCharactersById(int id);
}

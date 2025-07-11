import 'package:rick_and_morty/api/api_service.dart';
import 'package:rick_and_morty/api/dio_client.dart';
import 'package:rick_and_morty/data/mappers/character_mapper.dart';
import 'package:rick_and_morty/data/mappers/paged_list_mapper.dart';
import 'package:rick_and_morty/data/models/characters_dto.dart';
import 'package:rick_and_morty/data/models/common/paged_list_dto.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/domain/models/paged_list_entity.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final ApiService apiService = ApiService(dioClient: DioClient());

  @override
  Future<CharacterEntity> getCharactersById(int id) async {
    final CharacterDto characterDto = await apiService.getCharactersById(id);

    return CharacterMapper.fromDto(characterDto);
  }

  @override
  Future<PagedListEntity<CharacterEntity>> getCharacters({int? page}) async {
    final PagedListDto<CharacterDto> res = await apiService.getCharacters(page: page);
    return PagedListMapper<CharacterEntity, CharacterDto>().fromDto(
      res,
      CharacterMapper.fromDto,
    );
  }

  @override
  Future<List<CharacterEntity>> getCharactersByIds(List<int> ids) async {
    final List<CharacterDto> res = await apiService.getCharactersByIdList(ids);
    return res.map((e) => CharacterMapper.fromDto(e)).toList();
  }
}

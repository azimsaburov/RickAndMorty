import 'package:rick_and_morty/common/utils.dart';
import 'package:rick_and_morty/data/mappers/location_short_mapper.dart';
import 'package:rick_and_morty/data/models/characters_dto.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:collection/collection.dart';

class CharacterMapper {
  static CharacterEntity fromDto(CharacterDto dto) {
    return CharacterEntity(
      id: dto.id,
      name: dto.name,
      image: dto.image,
      species: dto.species,
      type: dto.type,
      status: _toCharacterStatus(dto.status),
      gender: _toGender(dto.gender),
      origin: LocationShortMapper.fromDto(dto.origin),
      location: LocationShortMapper.fromDto(dto.location),
      episodeIds: dto.episode.map((e) => Utils.getIdFromUrl(e)).toList(),
    );
  }

  static CharacterStatus _toCharacterStatus(String status) {
    // print(CharacterStatus.values); => [CharacterStatus.dead, CharacterStatus.alive, CharacterStatus.unknown]
    return CharacterStatus.values.firstWhereOrNull(
          (element) => element.name == status,
        ) ??
        CharacterStatus.unknown;
  }

  static Gender _toGender(String gender) {
    return Gender.values.firstWhereOrNull((e) => e.name == gender) ??
        Gender.unknown;
  }
}

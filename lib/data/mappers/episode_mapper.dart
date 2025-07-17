import 'package:rick_and_morty/common/utils.dart';
import 'package:rick_and_morty/data/models/episode_dto.dart';
import 'package:rick_and_morty/domain/models/episode_entity.dart';

class EpisodeMapper {
  static EpisodeEntity fromDto(EpisodeDto dto) {
    return EpisodeEntity(
      id: dto.id,
      name: dto.name,
      airDate: DateTime.parse(dto.airDate),
      characterIdList: dto.characters
          .map((e) => Utils.getIdFromUrl(e))
          .toList(),
    );
  }
}

import 'package:rick_and_morty/common/utils.dart';
import 'package:rick_and_morty/data/models/episode_dto.dart';
import 'package:rick_and_morty/domain/models/episode_entity.dart';

class EpisodeMapper {
  static EpisodeEntity fromDto(EpisodeDto dto) {
    return EpisodeEntity(
      id: dto.id,
      name: dto.name,
      airDate: DateTime.tryParse(dto.airDate) ?? _parseDateTime(dto.airDate),
      characterIdList: dto.characters
          .map((e) => Utils.getIdFromUrl(e))
          .toList(),
      episode: dto.episode,
    );
  }

  static DateTime _parseDateTime(String str) {
    // December 2, 2013
    str = str.replaceAll(',', '');
    // December 2 2013
    List<String> splitted = str.split(' ');
    //['December', '2', '2013']
    late int month;
    switch (splitted[0].toLowerCase()) {
      case 'january':
        month = 1;
        break;
      case 'fabruary':
        month = 2;
        break;
      case 'march':
        month = 3;
        break;
      case 'april':
        month = 4;
        break;
      case 'may':
        month = 5;
        break;
      case 'june':
        month = 6;
        break;
      case 'july':
        month = 7;
        break;
      case 'august':
        month = 8;
        break;
      case 'september':
        month = 9;
        break;
      case 'october':
        month = 10;
        break;
      case 'november':
        month = 11;
        break;
      default:
        month = 12;
        break;
    }
    return DateTime(int.parse(splitted[2]), month, int.parse(splitted[1]));
  }
}

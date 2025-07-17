import 'package:rick_and_morty/domain/models/episode_entity.dart';
import 'package:rick_and_morty/domain/models/paged_list_entity.dart';

abstract class EpisodeRepository {
  Future<PagedListEntity<EpisodeEntity>> getEpisodes({int? page, String? name});
  Future<List<EpisodeEntity>> getEpisodesByIds(List<int> ids);
  Future<EpisodeEntity> getEpisodeById(int id);
}

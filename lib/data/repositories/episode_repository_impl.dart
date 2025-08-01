import 'package:rick_and_morty/api/api_service.dart';
import 'package:rick_and_morty/api/dio_client.dart';
import 'package:rick_and_morty/data/mappers/episode_mapper.dart';
import 'package:rick_and_morty/data/mappers/paged_list_mapper.dart';
import 'package:rick_and_morty/data/models/episode_dto.dart';
import 'package:rick_and_morty/domain/models/episode_entity.dart';
import 'package:rick_and_morty/domain/models/paged_list_entity.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';

class EpisodeRepositoryImpl extends EpisodeRepository {
  final ApiService apiService = ApiService(dioClient: DioClient());


  @override
  Future<EpisodeEntity> getEpisodeById(int id) async {
    final res = await apiService.getEpisodeById(id);
    return EpisodeMapper.fromDto(res);
  }

  @override
  Future<PagedListEntity<EpisodeEntity>> getEpisodes({int? page, String? name}) async{
    final res = await apiService.getEpisodes();
    return PagedListMapper<EpisodeEntity, EpisodeDto>().fromDto(res, EpisodeMapper.fromDto);
  }

  @override
  Future<List<EpisodeEntity>> getEpisodesByIds(List<int> ids) async {
    final res = await apiService.getEpisodesByIdList(ids);
    return res.map((e)=> EpisodeMapper.fromDto(e)).toList();
  }

}
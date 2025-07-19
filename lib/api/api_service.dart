import 'package:dio/dio.dart';
import 'package:rick_and_morty/api/dio_client.dart';
import 'package:rick_and_morty/data/models/characters_dto.dart';
import 'package:rick_and_morty/data/models/common/paged_list_dto.dart';
import 'package:rick_and_morty/data/models/episode_dto.dart';
import 'package:rick_and_morty/data/models/locations_dto.dart';

class ApiService {
  final Dio _dio;

  ApiService({required DioClient dioClient}) : _dio = dioClient.dio;

  //CHARACTERS

  Future<List<CharacterDto>> getCharactersByIdList(List<int> ids) async {
    String idList = ids.join(','); //[1,2,3] => '1,2,3'
    Response res = await _dio.get('/character/$idList');
    List<CharacterDto> characters = [];
    for (var element in res.data) {
      CharacterDto characterModel = CharacterDto.fromJson(element);
      characters.add(characterModel);
    }
    return characters;
  }

  // res.data == Map<String, dynamic> это посути данные json
  // но помни что кроме data есть и другие данные например status или headers
  Future<CharacterDto> getCharactersById(int id) async {
    Response res = await _dio.get('/character/$id');
    CharacterDto character = CharacterDto.fromJson(res.data);
    return character;
  }

  Future<PagedListDto<CharacterDto>> getCharacters({
    int? page,
    String? name,
  }) async {
    Map<String, dynamic> queries = {
      if (page != null) 'page': page,
      if (name != null) 'name': name,
    };

    Response res = await _dio.get('/character', queryParameters: queries);
    PagedListDto<CharacterDto> pagedList = PagedListDto<CharacterDto>.fromJson(
      res.data,
      CharacterDto.fromJson,
    );
    return pagedList;
  }

  //LOCATIONS

  Future<LocationsDto> getLocationsById(int id) async {
    Response res = await _dio.get('/location/$id');
    LocationsDto location = LocationsDto.fromJson(res.data);
    return location;
  }

  Future<List<LocationsDto>> getLocationsByIdList(List<int> ids) async {
    String idList = ids.join(','); //[1,2,3] => '1,2,3'
    Response res = await _dio.get('/location/$idList');
    List<LocationsDto> locations = [];
    for (var element in res.data) {
      LocationsDto locationsModel = LocationsDto.fromJson(element);
      locations.add(locationsModel);
    }
    return locations;
  }

  Future<PagedListDto<LocationsDto>> getLocations() async {
    Response res = await _dio.get('/location');
    PagedListDto<LocationsDto> location = PagedListDto.fromJson(
      res.data,
      LocationsDto.fromJson,
    );

    return location;
  }

  //EPISODE

  Future<PagedListDto<EpisodeDto>> getEpisodes({
    int? page,
    String? name,
  }) async {
    Map<String, dynamic> queries = {
      if (page != null) "page": page,
      if (name != null) "name": name,
    };

    Response res = await _dio.get(
      "/episode",
      queryParameters: queries,
    );

    PagedListDto<EpisodeDto> pagedList = PagedListDto<EpisodeDto>.fromJson(
      res.data,
      EpisodeDto.fromJson,
    );
    return pagedList;
  }

  Future<List<EpisodeDto>> getEpisodesByIdList(List<int> ids) async {
    if(ids.isEmpty){
      return [];
    }
    String idList = ids.join(","); // [1, 2, 3] => "1,2,3"
    Response res = await _dio.get(
      "/episode/$idList,",
    ); // запрос на сервер => Response

    List<EpisodeDto> episodes = [];
    for (var element in res.data) {
      EpisodeDto episodeDto = EpisodeDto.fromJson(
        element,
      );

      episodes.add(episodeDto);
    }

    return episodes;
  }

  Future<EpisodeDto> getEpisodeById(int id) async {
    Response res = await _dio.get("/episode/$id");

    EpisodeDto episodeDto = EpisodeDto.fromJson(res.data);
    return episodeDto;
  }
}

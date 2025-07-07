import 'package:dio/dio.dart';
import 'package:rick_and_morty/api/dio_client.dart';
import 'package:rick_and_morty/data/models/characters/characters_models.dart';
import 'package:rick_and_morty/data/models/characters/paged_list_model.dart';
import 'package:rick_and_morty/data/models/locations/locations_models.dart';
import 'package:rick_and_morty/data/models/locations/paged_list_model.dart';

class ApiService {
  final Dio _dio;

  ApiService({required DioClient dioClient}) : _dio = dioClient.dio;

  //CHARACTERS

  Future<List<CharacterModel>> getCharactersByIdList(List<int> ids) async {
    String idList = ids.join(','); //[1,2,3] => '1,2,3'
    Response res = await _dio.get('/character/$idList');
    List<CharacterModel> characters = [];
    for (var element in res.data) {
      CharacterModel characterModel = CharacterModel.fromJson(element);
      characters.add(characterModel);
    }
    return characters;
  }

  // res.data == Map<String, dynamic> это посути данные json
  // но помни что кроме data есть и другие данные например status или headers
  Future<CharacterModel> getCharactersById(int id) async {
    Response res = await _dio.get('/character/$id');
    CharacterModel character = CharacterModel.fromJson(res.data);
    return character;
  }

  Future<PagedListModel<CharacterModel>> getCharacters() async {
    Response res = await _dio.get('/character');
    PagedListModel<CharacterModel> pagedList =
        PagedListModel<CharacterModel>.fromJson(
          res.data,
          CharacterModel.fromJson,
        );
    return pagedList;
  }

  //LOCATIONS

  Future<LocationsModel> getLocationsById(int id) async {
    Response res = await _dio.get('/location/$id');
    LocationsModel location = LocationsModel.fromJson(res.data);
    return location;
  }

  Future<List<LocationsModel>> getLocationsByIdList(List<int> ids) async {
    String idList = ids.join(','); //[1,2,3] => '1,2,3'
    Response res = await _dio.get('/location/$idList');
    List<LocationsModel> locations = [];
    for (var element in res.data) {
      LocationsModel locationsModel = LocationsModel.fromJson(element);
      locations.add(locationsModel);
    }
    return locations;
  }

  Future<LPagedListModel> getLocations() async{
    Response res = await _dio.get('/location');

    LPagedListModel location = LPagedListModel.fromJson(res.data);
    
    return location;
  }
}

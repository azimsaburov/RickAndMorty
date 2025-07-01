import 'package:dio/dio.dart';
import 'package:rick_and_morty/api/dio_client.dart';
import 'package:rick_and_morty/data/models/characters/characters_models.dart';
import 'package:rick_and_morty/data/models/locations/locations_models.dart';

class ApiService {
  final Dio _dio;

  ApiService({required DioClient dioClient}) : _dio = dioClient.dio;

//CHARACTERS

  Future<List<CharacterModel>> getCharactersByIdList(List<int> ids) async{
    String idList = ids.join(','); //[1,2,3] => '1,2,3'
    Response res = await _dio.get('/character/$idList');
    List<CharacterModel> characters = [];
    for(var element in res.data){
      CharacterModel characterModel = CharacterModel.fromJson(element);
      characters.add(characterModel);
    }
    return characters;
  }
// res.data == Map<String, dynamic> это посути данные json 
// но помни что кроме data есть и другие данные например status или headers
  Future<CharacterModel> getCharactersById(int id) async{
    Response res = await _dio.get('/character/$id');
    CharacterModel character = CharacterModel.fromJson(res.data);
    return character;
  }






//LOCATIONS

  Future<LocationsModels> getLocationsById(int id) async{
    Response res = await _dio.get('/location/$id');
    LocationsModels location = LocationsModels.fromJson(res.data);
    return location;
  }


}
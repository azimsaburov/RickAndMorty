import 'package:rick_and_morty/data/models/location_short_model.dart';

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String? type;
  final String gender;
  final String image;
  final String url;
  final String created;
  final LocationShortModel origin;
  final LocationShortModel location;
  final List<String> episode;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    this.type,
    required this.gender,
    required this.image,
    required this.url,
    required this.created,
    required this.origin,
    required this.location,
    required this.episode,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json[''],
      gender: json['gender'],
      image: json['image'],
      url: json['url'],
      created: json['created'],
      origin: LocationShortModel.fromJson(json['origin']),
      location: LocationShortModel.fromJson(json['location']),
      episode: (json['episode'] as List).map((e) => e as String).toList(),
    );
  }
}

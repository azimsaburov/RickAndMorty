import 'package:rick_and_morty/data/models/location_short_dto.dart';

class CharacterDto {
  final int id;
  final String name;
  final String status;
  final String species;
  final String? type;
  final String gender;
  final String image;
  final String url;
  final String created;
  final LocationShortDto origin;
  final LocationShortDto location;
  final List<String> episode;

  CharacterDto({
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

  factory CharacterDto.fromJson(Map<String, dynamic> json) {
    return CharacterDto(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json[''],
      gender: json['gender'],
      image: json['image'],
      url: json['url'],
      created: json['created'],
      origin: LocationShortDto.fromJson(json['origin']),
      location: LocationShortDto.fromJson(json['location']),
      episode: (json['episode'] as List).map((e) => e as String).toList(),
    );
  }
}

import 'package:rick_and_morty/domain/models/location_short_entity.dart';

class CharacterEntity {
  final int id;
  final String name;
  final CharacterStatus status;
  final String species;
  final String? type;
  final Gender gender;
  final String image;
  final LocationShortEntity origin;
  final LocationShortEntity location;
  final List<int> episodeIds;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    this.type,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.episodeIds,
  });
}

enum CharacterStatus {
  alive,
  dead,
  unknown,
}

enum Gender {
  female,
  male,
  genderless,
  unknown,
}
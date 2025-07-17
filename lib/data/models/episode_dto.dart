import 'package:json_annotation/json_annotation.dart';

part 'episode_dto.g.dart';

@JsonSerializable()
class EpisodeDto {
  final int id;
  final String name;

  @JsonKey(name: 'air_date')
  final String airDate;

  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  EpisodeDto({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory EpisodeDto.fromJson(Map<String, dynamic> json) => _$EpisodeDtoFromJson(json);
}

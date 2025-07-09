class LocationsDto {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;

  LocationsDto({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationsDto.fromJson(Map<String, dynamic> json) {
    return LocationsDto(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents: ['residents'],
      url: json['url'],
      created: json['created'],
    );
  }
}

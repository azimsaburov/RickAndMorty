class LocationsModels {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;

  LocationsModels({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationsModels.fromJson(Map<String, dynamic> json) {
    return LocationsModels(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents: (json['residents'] as List).map((e) => e as String).toList(),
      url: json['url'],
      created: json['created'],
    );
  }
}

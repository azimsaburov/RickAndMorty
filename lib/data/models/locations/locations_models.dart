class LocationsModel {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;

  LocationsModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationsModel.fromJson(Map<String, dynamic> json) {
    return LocationsModel(
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

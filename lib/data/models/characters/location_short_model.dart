class LocationShortModel {
  final String name;
  final String url;

  LocationShortModel({required this.name, required this.url});

  factory LocationShortModel.fromJson(Map<String, dynamic> json) {
    return LocationShortModel(name: json['name'], url: json['url']);
  }
}

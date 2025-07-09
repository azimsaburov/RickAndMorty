class LocationShortDto {
  final String name;
  final String url;

  LocationShortDto({required this.name, required this.url});

  factory LocationShortDto.fromJson(Map<String, dynamic> json) {
    return LocationShortDto(name: json['name'], url: json['url']);
  }
}

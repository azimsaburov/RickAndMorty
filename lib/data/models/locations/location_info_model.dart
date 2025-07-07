class LocationInfoModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  LocationInfoModel({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory LocationInfoModel.fromJson(Map<String, dynamic> json) {
    return LocationInfoModel(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}

class InfoDto {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  InfoDto({required this.count, required this.pages, this.next, this.prev});

  factory InfoDto.fromJson(Map<String, dynamic> json) {
    return InfoDto(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}

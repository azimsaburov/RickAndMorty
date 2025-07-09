import 'package:rick_and_morty/data/models/common/info_dto.dart';

class PagedListDto<T> {
  final InfoDto info;
  final List<T> results;

  PagedListDto({required this.info, required this.results});

  factory PagedListDto.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PagedListDto(
      info: InfoDto.fromJson(json['info']),
      results: (json['results'] as List).map((e) => fromJsonT(e)).toList(),
    );
  }
}

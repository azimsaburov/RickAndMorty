import 'package:rick_and_morty/data/models/common/info_model.dart';

class PagedListModel<T> {
  final InfoModel info;
  final List<T> results;

  PagedListModel({required this.info, required this.results});

  factory PagedListModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PagedListModel(
      info: InfoModel.fromJson(json['info']),
      results: (json['results'] as List).map((e) => fromJsonT(e)).toList(),
    );
  }
}

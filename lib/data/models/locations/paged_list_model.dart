import 'package:rick_and_morty/data/models/locations/location_info_model.dart';

class LPagedListModel {
  final LocationInfoModel info;
  final List<dynamic> results;

  LPagedListModel({required this.info, required this.results});

  factory LPagedListModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LPagedListModel(
      info: LocationInfoModel.fromJson(json['info']),
      results: json['results'],
    );
  }
}

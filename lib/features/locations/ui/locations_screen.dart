import 'package:flutter/material.dart';
import 'package:rick_and_morty/api/api_service.dart';
import 'package:rick_and_morty/api/dio_client.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService(dioClient: DioClient()).getLocationsById(34);
    ApiService(dioClient: DioClient()).getLocationsByIdList([3,4,50]);
    return Center(child: Text('Hello'),);
  }
}
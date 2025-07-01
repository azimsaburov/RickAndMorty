import 'package:flutter/material.dart';
import 'package:rick_and_morty/api/api_service.dart';
import 'package:rick_and_morty/api/dio_client.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService(dioClient: DioClient()).getCharactersByIdList([13, 21, 48]);
    ApiService(dioClient: DioClient()).getCharactersById(539);
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            SearchBar(
              elevation: WidgetStatePropertyAll(0.5),
              backgroundColor: WidgetStatePropertyAll(Color(0xFFF2F2F2)),
              leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              hintText: 'Поиск',
              trailing: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_alt_outlined),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

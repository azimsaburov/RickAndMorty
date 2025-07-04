import 'package:flutter/material.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    // ApiService(dioClient: DioClient()).getCharactersByIdList([13, 21, 48]);
    // ApiService(dioClient: DioClient()).getCharactersById(539);
    // ApiService(dioClient: DioClient()).getCharacters();
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

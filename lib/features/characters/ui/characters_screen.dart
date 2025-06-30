import 'package:flutter/material.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            SearchBar(
              elevation: WidgetStatePropertyAll(1),
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

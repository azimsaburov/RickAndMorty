import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/common/widgets/search_container.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //ToDo нужна собственный блок для эпизодов, кубит не вариант кажется
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SearchContainer(label: 'Найти эпизод', onSearchPressed: () {}),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
  
}

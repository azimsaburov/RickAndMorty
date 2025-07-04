import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/image_paths.dart';

class CharacterListTile extends StatelessWidget {
  final String name;
  final String gender;
  final String status;
  final String species;
  final String imageUrl;

  const CharacterListTile({
    super.key,
    required this.name,
    required this.gender,
    required this.status,
    required this.species,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 18,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          height: 74,
          clipBehavior: Clip.hardEdge,
          child: FadeInImage.assetNetwork(
            placeholder: ImagePaths.rikAndMorty,
            image: imageUrl,
          ),
        ),
        Column(children: [Text(name), Text(status), Text('$species, $gender')]),
      ],
    );
  }
}

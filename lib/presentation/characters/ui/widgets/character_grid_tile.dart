import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/image_paths.dart';
import 'package:rick_and_morty/domain/extensions/character_status_extension.dart';
import 'package:rick_and_morty/domain/extensions/gender_extension.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/presentation/characters/ui/screens/character_details_screen.dart';

class CharacterGridTile extends StatelessWidget {
  final String name;
  final Gender gender;
  final CharacterStatus status;
  final String species;
  final String imageUrl;
  final int id;

  const CharacterGridTile({
    super.key,
    required this.name,
    required this.gender,
    required this.status,
    required this.species,
    required this.imageUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailsScreen(id: id),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            height: 122,
            clipBehavior: Clip.hardEdge,
            child: FadeInImage.assetNetwork(
              fit: BoxFit.fill,
              placeholder: ImagePaths.rikAndMorty,
              image: imageUrl,
            ),
          ),
          SizedBox(height: 18),
          Text(
            status.text,
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: _getStatusColor(status)),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            '$species, ${gender.text}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).disabledColor,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(CharacterStatus status) {
    switch (status) {
      case CharacterStatus.alive:
        return Colors.green;
      case CharacterStatus.dead:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

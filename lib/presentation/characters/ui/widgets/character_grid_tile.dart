import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/image_paths.dart';

class CharacterGridTile extends StatelessWidget {
  final String name;
  final String gender;
  final String status;
  final String species;
  final String imageUrl;

  const CharacterGridTile({
    super.key,
    required this.name,
    required this.gender,
    required this.status,
    required this.species,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          status,
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: _getStatusColor(status)),
        ),
        Text(name, style: Theme.of(context).textTheme.bodyMedium),
        Text(
          '$species, $gender',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).disabledColor,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Alive':
        return Colors.green;
      case 'Dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

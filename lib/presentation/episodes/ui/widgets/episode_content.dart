import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/models/episode_entity.dart';
import 'package:rick_and_morty/presentation/episodes/ui/widgets/episode_list_tile.dart';

class EpisodeContent extends StatelessWidget {
  final List<EpisodeEntity> episodes;
  const EpisodeContent({super.key, required this.episodes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: episodes.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        return EpisodeListTile(
          name: episodes[index].name,
          id: episodes[index].id,
          airDate: episodes[index].airDate,
          episode: episodes[index].episode,
        );
      },
    );
  }
}

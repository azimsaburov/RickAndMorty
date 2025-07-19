import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EpisodeListTile extends StatelessWidget {
  final String name;
  final DateTime airDate;
  final int id;
  final String episode;

  const EpisodeListTile({
    super.key,
    required this.name,
    required this.id,
    required this.airDate,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => EpisodeDetailsScreen(id: id),
        //   ),
        // );
      },
      leading: Container(
        width: 74,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primary.withAlpha(100),
        ),
        child: Column(
          children: [
            Text(
              episode.substring(0, episode.length ~/ 2),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            Text(
              episode.substring(episode.length ~/ 2, episode.length),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
      title: Text(name, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(DateFormat("d MMM yyyy").format(airDate)),
      trailing: Icon(Icons.chevron_right),
    );
  }
}

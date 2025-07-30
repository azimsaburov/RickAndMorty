import 'package:rick_and_morty/domain/models/episode_entity.dart';

class EpisodeStateData {
  final List<EpisodeEntity> episodes;

  const EpisodeStateData({required this.episodes});

  const EpisodeStateData.empty() : episodes = const [];

  EpisodeStateData copyWith({List<EpisodeEntity>? episodes}) {
    return EpisodeStateData(episodes: episodes ?? this.episodes);
  }
}

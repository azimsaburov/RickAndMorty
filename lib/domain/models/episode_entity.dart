class EpisodeEntity {
  final int id;
  final String name;
  final DateTime airDate;
  final List<int> characterIdList;
  final String episode;

  EpisodeEntity({
    required this.id,
    required this.name,
    required this.airDate,
    required this.characterIdList,
    required this.episode, 
  });
}

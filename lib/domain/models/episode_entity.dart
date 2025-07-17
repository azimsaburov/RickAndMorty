class EpisodeEntity {
  final int id;
  final String name;
  final DateTime airDate;
  final List<int> characterIdList;

  EpisodeEntity({
    required this.id,
    required this.name,
    required this.airDate,
    required this.characterIdList,
  });
}

class PagedListEntity<T> {
  final int count;
  final bool hasNextPage;
  final List<T> results;

  PagedListEntity({
    required this.count,
    required this.hasNextPage,
    required this.results,
  });
}
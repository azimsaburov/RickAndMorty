import 'package:rick_and_morty/data/models/common/paged_list_dto.dart';
import 'package:rick_and_morty/domain/models/paged_list_entity.dart';

class PagedListMapper<T, E> {
  PagedListEntity<T> fromDto(PagedListDto dto, T Function(E) resultFromDto) {
    return PagedListEntity<T>(
      count: dto.info.count,
      hasNextPage: dto.info.next != null,
      results: dto.results.map((e) => resultFromDto(e)).toList(),
    );
  }
}

part of 'filter_cubit.dart';

@immutable
sealed class FilterState {
  final CharacterStatus? selectStatus;
  final Gender? selectGender;

  const FilterState({this.selectStatus, this.selectGender});
}

final class FilterInitial extends FilterState {}

final class FilterUpdated extends FilterState {
  const FilterUpdated({super.selectGender, super.selectStatus});
}

final class FilterUsed extends FilterState {
  const FilterUsed({super.selectGender, super.selectStatus});
}

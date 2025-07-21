part of 'filter_cubit_cubit.dart';

@immutable
sealed class FilterState {
  final Map<CharacterStatus, bool> filterStatus;
  final Map<Gender, bool> filterGender;

  FilterState({required this.filterStatus, required this.filterGender});
}

final class FilterInitial extends FilterState {
  FilterInitial()
    : super(
        filterGender: Map.fromEntries(
          Gender.values.map((e) => MapEntry(e, false)),
        ),
        filterStatus: Map.fromEntries(
          CharacterStatus.values.map((e) => MapEntry(e, false)),
        ),
      );
}

final class FilterUpdated extends FilterState{
  FilterUpdated({required super.filterStatus, required super.filterGender});
}

final class FilterUsed extends FilterState{
  FilterUsed({required super.filterStatus, required super.filterGender});
}

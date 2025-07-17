part of 'character_details_cubit.dart';

@immutable
sealed class CharacterDetailsState {}

final class CharacterDetailsInitial extends CharacterDetailsState {}

final class CharacterDetailsLoading extends CharacterDetailsState {}

final class CharacterDetailsSuccess extends CharacterDetailsState {
  final CharacterEntity character;
  final List<EpisodeEntity> episodes;

  CharacterDetailsSuccess({required this.character, required this.episodes});
}

final class CharacterDetailsError extends CharacterDetailsState {
  final String massage;

  CharacterDetailsError({required this.massage});
}

part of 'character_bloc.dart';

@immutable
sealed class CharacterEvent {}

final class LoadCharactersEvent extends CharacterEvent {
  final String? name;
  final CharacterStatus? characterStatus;
  final Gender? gender;

  LoadCharactersEvent({this.name, this.characterStatus, this.gender});
}

final class LoadNextCharactersPageEvent extends CharacterEvent {
  final String? name;
  final CharacterStatus? characterStatus;
  final Gender? gender;

  LoadNextCharactersPageEvent({this.name, this.characterStatus, this.gender});
}

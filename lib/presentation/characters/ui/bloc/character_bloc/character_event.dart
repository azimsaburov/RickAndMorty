part of 'character_bloc.dart';

@immutable
sealed class CharacterEvent {}

final class LoadCharactersEvent extends CharacterEvent{
  final String? name;

  LoadCharactersEvent({this.name});
}
final class LoadNextCharactersPageEvent extends CharacterEvent{
  final String? name;

  LoadNextCharactersPageEvent({this.name});
}
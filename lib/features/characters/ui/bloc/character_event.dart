part of 'character_bloc.dart';

@immutable
sealed class CharacterEvent {}

final class LoadCharactersEvent extends CharacterEvent{}

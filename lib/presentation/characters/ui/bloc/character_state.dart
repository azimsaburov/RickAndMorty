part of 'character_bloc.dart';

@immutable
sealed class CharacterState {
  final CharacterStateData data;

  const CharacterState({required this.data});
}

final class CharacterInitial extends CharacterState {
  const CharacterInitial() : super(data: const CharacterStateData.empty());
}

final class CharacterLoading extends CharacterState {
  const CharacterLoading({required super.data});
}

final class CharacterLoaded extends CharacterState {
  const CharacterLoaded({required super.data});
}

final class CharacterError extends CharacterState {
  final String message;
  const CharacterError(this.message, {required super.data});
}

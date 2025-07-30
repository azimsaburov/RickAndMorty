part of 'episode_bloc.dart';

@immutable
sealed class EpisodeState {
  final EpisodeStateData data;

  const EpisodeState({required this.data});
}

final class EpisodeInitial extends EpisodeState {
  const EpisodeInitial()  : super(data: const EpisodeStateData.empty());
}

final class EpisodeSuccess extends EpisodeState {
  const EpisodeSuccess({required super.data});
}

final class EpisodeLoaded extends EpisodeState {
  const EpisodeLoaded({required super.data});
}

final class EpisodeLoading extends EpisodeState {
  const EpisodeLoading({required super.data});
}

final class EpisodeNextPage extends EpisodeState {
  const EpisodeNextPage({required super.data});
}

final class EpisodeError extends EpisodeState {
  final String message;

  const EpisodeError({required this.message, required super.data});
}

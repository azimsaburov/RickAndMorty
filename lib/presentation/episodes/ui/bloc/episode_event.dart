part of 'episode_bloc.dart';

@immutable
sealed class EpisodeEvent {}

final class LoadEpisodesEvent extends EpisodeEvent {
final int? ids;
final String? name;

  LoadEpisodesEvent({this.ids, this.name});
}

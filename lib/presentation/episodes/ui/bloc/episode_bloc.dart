import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
// import 'package:rick_and_morty/data/repositories/episode_repository_impl.dart';
// import 'package:rick_and_morty/domain/models/episode_entity.dart';
// import 'package:rick_and_morty/domain/models/paged_list_entity.dart';
import 'package:rick_and_morty/presentation/episodes/ui/bloc/episode_state_data.dart';
// import 'package:rick_and_morty/presentation/episodes/ui/bloc/episode_state_data.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeBloc() : super(EpisodeInitial()) {
    on<LoadEpisodesEvent>(_onLoadEpisode);
  }

  void _onLoadEpisode(
    LoadEpisodesEvent event,
    Emitter<EpisodeState> emit,
  ) async {
    emit(EpisodeLoading(data: state.data));
    // List<EpisodeEntity> episodesByIds =
    //     await EpisodeRepositoryImpl().getEpisodesByIds();

    // emit(
    //   EpisodeLoaded(
    //     data: state.data.copyWith(episodes: episodesByIds),
    //   ),
    // );

    emit(EpisodeError(message: 'Какаято ошибка проверь', data: state.data));
  }
}

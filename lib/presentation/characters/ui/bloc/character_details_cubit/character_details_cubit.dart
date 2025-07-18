import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty/data/repositories/episode_repository_impl.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/domain/models/episode_entity.dart';

part 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit() : super(CharacterDetailsInitial());

  Future loadDetails(int id) async {
    emit(CharacterDetailsLoading());
    try {
      CharacterEntity character = await CharacterRepositoryImpl()
          .getCharactersById(id);
      List<EpisodeEntity> episodes = await EpisodeRepositoryImpl()
          .getEpisodesByIds(character.episodeIds);
      emit(CharacterDetailsSuccess(character: character, episodes: episodes));
    } catch (e) {
      emit(CharacterDetailsError(massage: e.toString()));
    }
  }
}

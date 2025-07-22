import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/domain/models/paged_list_entity.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc/character_state_data.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
    on<LoadNextCharactersPageEvent>(_onLoadNextCharactersPage);
  }

  void _onLoadCharacters(
    LoadCharactersEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoading(data: state.data));

    try {
      PagedListEntity<CharacterEntity> pagedCharacters =
          await CharacterRepositoryImpl().getCharacters(
            name: event.name,
            characterStatus: event.characterStatus,
            gender: event.gender,
          );

      emit(
        CharacterLoaded(
          data: state.data.copyWith(
            characters: pagedCharacters.results,
            totalCount: pagedCharacters.count,
            page: 1,
            hasNextPage: pagedCharacters.hasNextPage,
          ),
        ),
      );
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        // print('if worked');
        emit(CharacterLoaded(data: state.data.copyWith(characters: [])));
      } else {
        emit(CharacterError(message: '$e', data: state.data));
      }
    }
  }

  void _onLoadNextCharactersPage(
    LoadNextCharactersPageEvent event,
    Emitter<CharacterState> emit,
  ) async {
    if (state.data.hasNextPage) {
      emit(CharacterNextPageLoading(data: state.data));

      PagedListEntity<CharacterEntity> pagedCharacters =
          await CharacterRepositoryImpl().getCharacters(
            page: state.data.page + 1,
            name: event.name,
            characterStatus: event.characterStatus,
            gender: event.gender,
          );
      emit(
        CharacterLoaded(
          data: state.data.copyWith(
            characters: [...state.data.characters, ...pagedCharacters.results],
            totalCount: pagedCharacters.count,
            page: state.data.page + 1,
            hasNextPage: pagedCharacters.hasNextPage,
          ),
        ),
      );
    }
  }
}

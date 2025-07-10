import 'package:bloc/bloc.dart';
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
  }

  void _onLoadCharacters(
    LoadCharactersEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoading(data: state.data));

    PagedListEntity<CharacterEntity> pagedCharacters = await  CharacterRepositoryImpl().getCharacters();

    emit(
      CharacterLoaded(
        data: state.data.copyWith(
          characters: pagedCharacters.results,
          totalCount: pagedCharacters.count,
        ),
      ),
    );
  }
}

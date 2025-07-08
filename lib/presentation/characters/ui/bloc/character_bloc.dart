import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/api/api_service.dart';
import 'package:rick_and_morty/api/dio_client.dart';
import 'package:rick_and_morty/data/models/characters_models.dart';
import 'package:rick_and_morty/data/models/common/paged_list_model.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_state_data.dart';

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

    ApiService service = ApiService(dioClient: DioClient());

    PagedListModel<CharacterModel> pagedCharacters = await service
        .getCharacters();

    emit(
      CharacterLoaded(
        data: state.data.copyWith(
          characters: pagedCharacters.results,
          totalCount: pagedCharacters.info.count,
        ),
      ),
    );
  }
}

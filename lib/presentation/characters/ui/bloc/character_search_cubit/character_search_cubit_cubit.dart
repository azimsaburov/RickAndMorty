import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'character_search_cubit_state.dart';

class CharacterSearchCubitCubit extends Cubit<CharacterSearchCubitState> {
  CharacterSearchCubitCubit() : super(CharacterSearchCubitInitial());
}

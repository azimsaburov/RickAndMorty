
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  void updateFilters({CharacterStatus? selectStatus, Gender? selectGender}) {
    bool statusChenged = selectStatus != state.selectStatus;
    bool genderCheged = selectGender != state.selectGender;
    if (statusChenged || genderCheged) {
      emit(
        FilterUpdated(selectGender: selectGender, selectStatus: selectStatus),
      );
    }
  }

  void filterUsed() {
    emit(
      FilterUsed(
        selectGender: state.selectGender,
        selectStatus: state.selectStatus,
      ),
    );
  }
}

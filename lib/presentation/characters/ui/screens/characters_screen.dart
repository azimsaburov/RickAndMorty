import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc/character_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/filter_cubit/filter_cubit.dart';
import 'package:rick_and_morty/presentation/characters/ui/screens/character_search_screen.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_content.dart';
import 'package:rick_and_morty/presentation/common/widgets/search_container.dart';
import 'package:rick_and_morty/presentation/common/widgets/total_count_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  ScrollController controller = ScrollController();
  late bool isListView;
  CharacterBloc get bloc => context.read<CharacterBloc>();
  FilterCubit get filterCubit => context.read<FilterCubit>();

  @override
  void initState() {
    bloc.add(LoadCharactersEvent());
    isListView = true;
    controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    controller.dispose();
    super.dispose();
  }

  void _listener() {
    final bool isCloseToEnd =
        controller.position.pixels > controller.position.maxScrollExtent - 200;
    final bool isNextPageLoadingPossible =
        bloc.state is! CharacterNextPageLoading && bloc.state.data.hasNextPage;
    if (isCloseToEnd && isNextPageLoadingPossible) {
      //пробросить событие которая грузит след страницу
      bloc.add(
        LoadNextCharactersPageEvent(
          characterStatus: filterCubit.state.selectStatus,
          gender: filterCubit.state.selectGender,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.all(14),
        child: BlocListener<FilterCubit, FilterState>(
          listener: (BuildContext context, FilterState state) {
            if (state is FilterUpdated) {
              bloc.add(
                LoadCharactersEvent(
                  gender: state.selectGender,
                  characterStatus: state.selectStatus,
                ),
              );
            }
          },
          child: BlocBuilder<CharacterBloc, CharacterState>(
            builder: (BuildContext context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchContainer(
                    label: 'Найти персонажа',
                    onSearchPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CharacterSearchScreen(),
                        ),
                      );
                    },
                    onFilterPressed: () {},
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TotalCountWidget(
                          title: 'Всего персонажей',
                          amount: state.data.totalCount,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isListView ? Icons.grid_view : Icons.list,
                          color: Theme.of(context).disabledColor,
                        ),
                        onPressed: () =>
                            setState(() => isListView = !isListView),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  if (state is CharacterLoaded)
                    Expanded(
                      child: CharacterContent(
                        controller: controller,
                        showLoadingIndicator: state is CharacterNextPageLoading,
                        characters: state.data.characters,
                        isListView: isListView,
                      ),
                    )
                  else if (state is CharacterLoading)
                    Expanded(child: Center(child: CircularProgressIndicator())),
                  SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

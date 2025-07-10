import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc/character_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/screens/character_search_screen.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_content.dart';
import 'package:rick_and_morty/presentation/common/widgets/total_count_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late bool isListView;
  @override
  void initState() {
    context.read<CharacterBloc>().add(LoadCharactersEvent());
    isListView = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.all(14),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (BuildContext context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(
                  
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CharacterSearchScreen(),
                    ),
                  ),
                  //enabled: false,
                  elevation: WidgetStatePropertyAll(0.5),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFF2F2F2)),
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  hintText: 'Поиск',
                  trailing: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_alt_outlined),
                    ),
                  ],
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
                      onPressed: () => setState(() => isListView = !isListView),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                if (state is CharacterLoaded)
                  Expanded(
                    child: CharacterContent(
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
    );
  }
}

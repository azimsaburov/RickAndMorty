import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/constants/image_paths.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc/character_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_list_tile.dart';

class CharacterSearchScreen extends StatefulWidget {
  const CharacterSearchScreen({super.key});

  @override
  State<CharacterSearchScreen> createState() => _CharacterSearchScreenState();
}

class _CharacterSearchScreenState extends State<CharacterSearchScreen> {
  final TextEditingController controller = TextEditingController();
  final CharacterBloc _characterBloc = CharacterBloc();
  Timer? _debounce;
  final ScrollController scrollController = ScrollController();
  late bool isCloseToEnd;
  late bool isNext;
  String searchQuery = '';

  @override
  void initState() {
    scrollController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    _characterBloc.close();
    scrollController.removeListener(_listener);
    scrollController.dispose();
    super.dispose();
  }

  void _listener() {
    isCloseToEnd =
        scrollController.position.pixels >
        scrollController.position.maxScrollExtent - 200;
    isNext =
        _characterBloc.state is! CharacterNextPageLoading &&
        _characterBloc.state.data.hasNextPage;
    if (isCloseToEnd && isNext) {
      _characterBloc.add(LoadNextCharactersPageEvent(name: searchQuery));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              TextField(
                autofocus: true,
                controller: controller,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => controller.clear(),
                  ),
                ),
                onChanged: _onSearchChenged,
              ),
              Text(
                'РЕЗУЛЬТАТЫ ПОИСКА',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: BlocConsumer<CharacterBloc, CharacterState>(
                  bloc: _characterBloc,

                  listener: (context, state) {
                    if (state is CharacterError) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Понял'),
                              ),
                            ],
                            icon: Icon(
                              Icons.error,
                              size: 50,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            content: Text(
                              state.message,
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is CharacterLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is CharacterLoaded) {
                      final characters = state.data.characters;
                      if (characters.isEmpty) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImagePaths.mortyNoContent,
                              height: 251,
                              width: 150,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 80),
                              child: Text(
                                'Персонаж с таким именем не найден',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: Theme.of(context).dividerColor,
                                    ),
                              ),
                            ),
                          ],
                        );
                      }
                      return ListView.separated(
                        controller: scrollController,
                        itemCount: state is CharacterNextPageLoading
                            ? characters.length + 1
                            : characters.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        padding: EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          if (state is CharacterNextPageLoading &&
                              index >= characters.length) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return CharacterListTile(
                            name: characters[index].name,
                            gender: characters[index].gender,
                            status: characters[index].status,
                            species: characters[index].species,
                            imageUrl: characters[index].image,
                             id: characters[index].id,
                          );
                        },
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSearchChenged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _characterBloc.add(LoadCharactersEvent(name: query));
      searchQuery = query;
    });
  }
}

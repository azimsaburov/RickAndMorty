import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/constants/image_paths.dart';
import 'package:rick_and_morty/domain/extensions/character_status_extension.dart';
import 'package:rick_and_morty/domain/extensions/gender_extension.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_details_cubit/character_details_cubit.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/info_tile.dart';
import 'package:rick_and_morty/presentation/episodes/ui/widgets/episode_list_tile.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final int id;
  const CharacterDetailsScreen({super.key, required this.id});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  late CharacterDetailsCubit _cubit;
  @override
  void initState() {
    _cubit = CharacterDetailsCubit();
    _cubit.loadDetails(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: BlocConsumer<CharacterDetailsCubit, CharacterDetailsState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is CharacterDetailsError) {
            showDialog(
              context: context,
              builder: (context) {
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
                  content: Text(state.massage, textAlign: TextAlign.center),
                );
              },
            );
          }
        },

        builder: (context, state) {
          if (state is CharacterDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CharacterDetailsSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._getCharacterInfoWidget(state),
                  Divider(),
                  ..._getEpisodeList(state),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  List<Widget> _getCharacterInfoWidget(CharacterDetailsSuccess state) {
    Widget image = FadeInImage.assetNetwork(
      image: state.character.image,
      fit: BoxFit.cover,
      placeholder: ImagePaths.placeholder,
    );
    return [
      SizedBox(
        height: 296,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 218,
                  width: double.infinity,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                      tileMode: TileMode.clamp,
                    ),
                    child: image,
                  ),
                ),
              ],
            ),
            Container(
              height: 162,
              width: 162,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 8,
                ),
              ),
              child: ClipOval(child: image),
            ),
            Container(
              height: 162,
              width: 162,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 8,
                ),
              ),
              child: ClipOval(child: image),
            ),
          ],
        ),
      ),
      SizedBox(height: 24),
      Center(
        child: Text(
          state.character.name,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      Center(
        child: Text(
          state.character.status.text,
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: state.character.status.color),
        ),
      ),
      SizedBox(height: 24),
      Row(
        children: [
          Expanded(
            child: InfoTile(label: "Пол", value: state.character.gender.text),
          ),
          Expanded(
            child: InfoTile(label: "Расса", value: state.character.species),
          ),
        ],
      ),
      InfoTile(
        label: "Место рождения",
        value: state.character.origin.name,
        onTap: () {
          // переход на детали локации
        },
      ),
      InfoTile(
        label: "Местоположение",
        value: state.character.location.name,
        onTap: () {
          // переход на детали локации
        },
      ),
    ];
  }

  List<Widget> _getEpisodeList(CharacterDetailsSuccess state) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "Эпизоды",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      ...List.generate(state.episodes.length, (index) {
        return EpisodeListTile(
          name: state.episodes[index].name,
          id: state.episodes[index].id,
          airDate: state.episodes[index].airDate,
          episode: state.episodes[index].episode,
        );
      }),
    ];
  }
}

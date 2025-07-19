import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/constants/image_paths.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_details_cubit/character_details_cubit.dart';

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
            Widget image = FadeInImage.assetNetwork(
              image: state.character.image,
              fit: BoxFit.cover,
              placeholder: ImagePaths.placeholder,
            );
            return Column(
              children: [
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
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                image,
                                Positioned.fill(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 5,
                                      sigmaY: 5,
                                    ),
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ],
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
                        child: ClipOval(child: image,),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

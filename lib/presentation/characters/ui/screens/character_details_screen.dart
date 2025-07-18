import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CharacterDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              SizedBox(
                height: 296,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [Container(height: 218, color: Colors.red)],
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
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

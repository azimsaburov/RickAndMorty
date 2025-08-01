import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/common/widgets/search_container.dart';
import 'package:rick_and_morty/presentation/episodes/ui/bloc/episode_bloc.dart';
import 'package:rick_and_morty/presentation/episodes/ui/widgets/episode_content.dart';

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({super.key});

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}
class _EpisodesScreenState extends State<EpisodesScreen> {


@override
  void initState() {
    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: BlocBuilder<EpisodeBloc, EpisodeState>(
          builder: (context, state) {
            return Column(
              children: [
                SearchContainer(label: 'Найти эпизод', onSearchPressed: () {}),
                SizedBox(height: 35),
                Text("Episodes"),
                SizedBox(height: 12,),
                EpisodeContent(episodes: state.data.episodes),
                // FlutterLogo( size: 100),
              ],
            );
          },
        ),
      ),
    );
  }
}

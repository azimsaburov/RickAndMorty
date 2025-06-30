import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/constants/icon_paths.dart';
import 'package:rick_and_morty/features/characters/ui/characters_screen.dart';
import 'package:rick_and_morty/features/episodes/ui/episodes_screen.dart';
import 'package:rick_and_morty/features/locations/ui/locations_screen.dart';
import 'package:rick_and_morty/features/settings/ui/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: _buildTabs(),
        currentIndex: _currentIndex,
        onTap: (value) => setState(() => _currentIndex = value),
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.outline,
      ),
    );
  }

  List<BottomNavigationBarItem> _buildTabs() {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(IconPaths.characters, colorFilter: getFilter(0)),
        label: 'Персонажи',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(IconPaths.locations, colorFilter: getFilter(1)),
        label: 'Локации',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(IconPaths.episodes, colorFilter: getFilter(2)),
        label: 'Эпизоды',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(IconPaths.settings, colorFilter: getFilter(3)),
        label: 'Настройки',
      ),
    ];
  }

  ColorFilter getFilter(int index) => ColorFilter.mode(
    index == _currentIndex
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.outline,
    BlendMode.srcIn,
  );

  Widget get _activePage {
    switch (_currentIndex) {
      case 0:
        return CharactersScreen();
      case 1:
        return LocationsScreen();
      case 2:
        return EpisodesScreen();
      case 3:
        return SettingsScreen();
      default:
        return ErrorWidget(Exception('Неверный индекс на Старанице'));
    }
  }
}

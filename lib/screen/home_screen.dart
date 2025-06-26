import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/constants/icon_paths.dart';

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
}

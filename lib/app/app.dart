import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/app/constants/app_colors.dart';
import '../features/characters/presentation/pages/characters_page.dart';
import '../features/episodes/presentation/pages/episodes_page.dart';
import '../features/locations/presentation/pages/locations_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import 'constants/app_icons.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CupertinoTabController _tabController = CupertinoTabController(
    initialIndex: 0,
  );

  final List<Widget> _pages = const [
    CharactersPage(),
    EpisodesPage(),
    LocationsPage(),
    SettingsPage(),
  ];

  final List<BottomNavigationBarItem> _tabBarItems = [
    BottomNavigationBarItem(
      icon: AppIcons.characters(),
      activeIcon: AppIcons.characters(color: AppColors.blue),
      label: 'Персонажи',
    ),
    BottomNavigationBarItem(
      icon: AppIcons.episodes(),
      activeIcon: AppIcons.episodes(color: AppColors.blue),
      label: 'Эпизоды',
    ),
    BottomNavigationBarItem(
      icon: AppIcons.locations(),
      activeIcon: AppIcons.locations(color: AppColors.blue),
      label: 'Локации',
    ),
    BottomNavigationBarItem(
      icon: AppIcons.settings(),
      activeIcon: AppIcons.settings(color: AppColors.blue),
      label: 'Настройки',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController,
      tabBuilder: (context, index) => _pages[index],
      tabBar: CupertinoTabBar(items: _tabBarItems),
    );
  }
}

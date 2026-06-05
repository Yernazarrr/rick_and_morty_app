import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/extensions.dart';

/// Каркас с нижней навигацией, оборачивающий [StatefulNavigationShell].
/// Каждая вкладка хранит свой стек навигации и позицию прокрутки.
class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.sentiment_satisfied_alt_outlined),
            activeIcon: const Icon(Icons.sentiment_very_satisfied),
            label: l10n.navCharacters,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.public_outlined),
            activeIcon: const Icon(Icons.public),
            label: l10n.navLocations,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.live_tv_outlined),
            activeIcon: const Icon(Icons.live_tv),
            label: l10n.navEpisodes,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }
}

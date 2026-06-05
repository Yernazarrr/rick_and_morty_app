import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/characters/presentation/pages/characters_page.dart';
import '../../features/characters/presentation/pages/character_detail_page.dart';
import '../../features/episodes/presentation/pages/episode_detail_page.dart';
import '../../features/episodes/presentation/pages/episodes_page.dart';
import '../../features/locations/presentation/pages/location_detail_page.dart';
import '../../features/locations/presentation/pages/locations_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../widgets/scaffold_with_nav_bar.dart';

part 'app_router.g.dart';

/// Ключи навигаторов корня и отдельных веток.
final GlobalKey<NavigatorState> _rootKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

/// Глобальный экземпляр роутера. Маршруты генерируются go_router_builder
/// (`$appRoutes`).
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootKey,
    initialLocation: CharactersRoute.path,
    debugLogDiagnostics: true,
    routes: $appRoutes,
  );
}

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<CharactersBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<CharactersRoute>(
          path: CharactersRoute.path,
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<CharacterDetailRoute>(path: 'detail/:id'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<LocationsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<LocationsRoute>(
          path: LocationsRoute.path,
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<LocationDetailRoute>(path: 'detail/:id'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<EpisodesBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<EpisodesRoute>(
          path: EpisodesRoute.path,
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<EpisodeDetailRoute>(path: 'detail/:id'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SettingsRoute>(path: SettingsRoute.path),
      ],
    ),
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) => ScaffoldWithNavBar(navigationShell: navigationShell);
}

class CharactersBranchData extends StatefulShellBranchData {
  const CharactersBranchData();
}

class LocationsBranchData extends StatefulShellBranchData {
  const LocationsBranchData();
}

class EpisodesBranchData extends StatefulShellBranchData {
  const EpisodesBranchData();
}

class SettingsBranchData extends StatefulShellBranchData {
  const SettingsBranchData();
}

/// Персонажи
class CharactersRoute extends GoRouteData with $CharactersRoute {
  const CharactersRoute();
  static const String path = '/characters';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CharactersPage();
}

class CharacterDetailRoute extends GoRouteData with $CharacterDetailRoute {
  const CharacterDetailRoute({required this.id});
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CharacterDetailPage(id: id);
}

/// Локации
class LocationsRoute extends GoRouteData with $LocationsRoute {
  const LocationsRoute();
  static const String path = '/locations';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LocationsPage();
}

class LocationDetailRoute extends GoRouteData with $LocationDetailRoute {
  const LocationDetailRoute({required this.id});
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LocationDetailPage(id: id);
}

/// Эпизоды
class EpisodesRoute extends GoRouteData with $EpisodesRoute {
  const EpisodesRoute();
  static const String path = '/episodes';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EpisodesPage();
}

class EpisodeDetailRoute extends GoRouteData with $EpisodeDetailRoute {
  const EpisodeDetailRoute({required this.id});
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EpisodeDetailPage(id: id);
}

/// Настройки
class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();
  static const String path = '/settings';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

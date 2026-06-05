// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mainShellRouteData];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
  factory: $MainShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/characters',
          factory: $CharactersRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'detail/:id',
              factory: $CharacterDetailRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/locations',
          factory: $LocationsRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'detail/:id',
              factory: $LocationDetailRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/episodes',
          factory: $EpisodesRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'detail/:id',
              factory: $EpisodeDetailRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/settings',
          factory: $SettingsRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

mixin $CharactersRoute on GoRouteData {
  static CharactersRoute _fromState(GoRouterState state) =>
      const CharactersRoute();

  @override
  String get location => GoRouteData.$location('/characters');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CharacterDetailRoute on GoRouteData {
  static CharacterDetailRoute _fromState(GoRouterState state) =>
      CharacterDetailRoute(id: int.parse(state.pathParameters['id']!));

  CharacterDetailRoute get _self => this as CharacterDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/characters/detail/${Uri.encodeComponent(_self.id.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LocationsRoute on GoRouteData {
  static LocationsRoute _fromState(GoRouterState state) =>
      const LocationsRoute();

  @override
  String get location => GoRouteData.$location('/locations');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LocationDetailRoute on GoRouteData {
  static LocationDetailRoute _fromState(GoRouterState state) =>
      LocationDetailRoute(id: int.parse(state.pathParameters['id']!));

  LocationDetailRoute get _self => this as LocationDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/locations/detail/${Uri.encodeComponent(_self.id.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EpisodesRoute on GoRouteData {
  static EpisodesRoute _fromState(GoRouterState state) => const EpisodesRoute();

  @override
  String get location => GoRouteData.$location('/episodes');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EpisodeDetailRoute on GoRouteData {
  static EpisodeDetailRoute _fromState(GoRouterState state) =>
      EpisodeDetailRoute(id: int.parse(state.pathParameters['id']!));

  EpisodeDetailRoute get _self => this as EpisodeDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/episodes/detail/${Uri.encodeComponent(_self.id.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

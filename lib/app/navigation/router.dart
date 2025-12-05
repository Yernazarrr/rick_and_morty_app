import 'package:flutter/cupertino.dart';

class AppRoutes {
  AppRoutes._();

  static const String characters = '/';
  static const String locations = '/locations';
  static const String episodes = '/episodes';
  static const String settings = '/settings';

  static const String profileRoute = 'characterProfile';
  static const String characterProfile = '/characterProfile';

  static const String locationRoute = 'locationProfile';
  static const String locationProfile = '/locationProfile';

  static const String residentsRoute = 'residents';
  static const String residents = '/locations/residents';

  static const String episodeRoute = 'episode';
  static const String episodeProfile = '/episode';
}

final _routerKey = GlobalKey<NavigatorState>();

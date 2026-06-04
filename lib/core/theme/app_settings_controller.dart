import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

/// Настройки всего приложения (режим темы + локаль) поддерживаются SharedPreferences.
/// Использует [ChangeNotifier] `provider` в то время как состояние функций обрабатывается BLoC.
@lazySingleton
class AppSettingsController extends ChangeNotifier {
  AppSettingsController(this._prefs) {
    _load();
  }

  final SharedPreferences _prefs;

  ThemeMode _themeMode = ThemeMode.system;
  Locale? _locale;

  ThemeMode get themeMode => _themeMode;
  Locale? get locale => _locale;
  bool get isDark => _themeMode == ThemeMode.dark;

  void _load() {
    final theme = _prefs.getString(AppConstants.prefThemeMode);
    _themeMode = switch (theme) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => ThemeMode.system,
    };
    final code = _prefs.getString(AppConstants.prefLocale);
    if (code != null && code.isNotEmpty) _locale = Locale(code);
  }

  Future<void> setDarkMode(bool enabled) async {
    _themeMode = enabled ? ThemeMode.dark : ThemeMode.light;
    await _prefs.setString(
      AppConstants.prefThemeMode,
      enabled ? 'dark' : 'light',
    );
    notifyListeners();
  }

  Future<void> toggleTheme() => setDarkMode(!isDark);

  Future<void> setLocale(Locale? locale) async {
    _locale = locale;
    if (locale == null) {
      await _prefs.remove(AppConstants.prefLocale);
    } else {
      await _prefs.setString(AppConstants.prefLocale, locale.languageCode);
    }
    notifyListeners();
  }
}

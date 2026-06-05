import 'package:flutter/widgets.dart';

/// Контрольные точки ширины экрана для адаптивной вёрстки.
class Breakpoints {
  const Breakpoints._();

  /// Начиная с этой ширины раскладка считается планшетной.
  static const double tablet = 600;

  /// Начиная с этой ширины раскладка считается десктопной.
  static const double desktop = 1024;
}

/// Тип экрана, выведенный из его ширины.
enum ScreenType { mobile, tablet, desktop }

/// Адаптивные помощники, доступные прямо из [BuildContext].
///
/// Используют [MediaQuery.sizeOf], поэтому виджеты автоматически
/// перестраиваются при изменении размера окна или повороте экрана.
extension ResponsiveX on BuildContext {
  /// Текущая ширина экрана в логических пикселях.
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Тип экрана по текущей ширине.
  ScreenType get screenType {
    final width = screenWidth;
    if (width >= Breakpoints.desktop) return ScreenType.desktop;
    if (width >= Breakpoints.tablet) return ScreenType.tablet;
    return ScreenType.mobile;
  }

  /// Количество колонок сетки в зависимости от ширины экрана.
  int gridColumns({int mobile = 2, int tablet = 3, int desktop = 4}) =>
      switch (screenType) {
        ScreenType.mobile => mobile,
        ScreenType.tablet => tablet,
        ScreenType.desktop => desktop,
      };

  /// Максимальная ширина контента, чтобы он не растягивался
  /// на широких экранах (планшеты, десктоп).
  double get contentMaxWidth => switch (screenType) {
        ScreenType.mobile => double.infinity,
        ScreenType.tablet => 720,
        ScreenType.desktop => 960,
      };
}

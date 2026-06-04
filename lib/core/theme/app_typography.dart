import 'package:flutter/material.dart';

/// Общие стили текста. Предохраняет виджеты презентаций от магических чисел.
abstract final class AppTypography {
  const AppTypography._();

  static TextTheme textTheme(Color primary, Color secondary) => TextTheme(
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: primary,
      letterSpacing: -0.5,
    ),
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: primary,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: primary,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: primary,
    ),
    bodyLarge: TextStyle(fontSize: 15, color: primary, height: 1.45),
    bodyMedium: TextStyle(fontSize: 14, color: secondary, height: 1.4),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.6,
      color: secondary,
    ),
  );
}

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

/// Создает светлые и темные [ThemeData] для приложения.
abstract final class AppTheme {
  const AppTheme._();

  static ThemeData get light => _build(
    brightness: Brightness.light,
    background: AppColors.lightBackground,
    surface: AppColors.lightSurface,
    card: AppColors.lightCard,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    divider: AppColors.lightDivider,
    accent: AppColors.accent,
  );

  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    background: AppColors.darkBackground,
    surface: AppColors.darkSurface,
    card: AppColors.darkCard,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    divider: AppColors.darkDivider,
    accent: AppColors.accentDark,
  );

  static ThemeData _build({
    required Brightness brightness,
    required Color background,
    required Color surface,
    required Color card,
    required Color textPrimary,
    required Color textSecondary,
    required Color divider,
    required Color accent,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: accent,
      brightness: brightness,
      primary: accent,
      surface: background,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: background,
      colorScheme: colorScheme,
      textTheme: AppTypography.textTheme(textPrimary, textSecondary),
      dividerColor: divider,
      dividerTheme: DividerThemeData(color: divider, thickness: 1, space: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: TextStyle(color: textSecondary, fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: accent, width: 1.4),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: background,
        selectedItemColor: accent,
        unselectedItemColor: textSecondary,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        elevation: 8,
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      extensions: <ThemeExtension<dynamic>>[
        AppStatusColors(
          alive: AppColors.alive,
          dead: AppColors.dead,
          unknown: AppColors.unknownStatus,
          secondaryText: textSecondary,
        ),
      ],
    );
  }
}

/// Расширение темы, предоставляющее виджетам возможность
/// выбора цветов состояния (активен/неактивен/неизвестен).
@immutable
class AppStatusColors extends ThemeExtension<AppStatusColors> {
  const AppStatusColors({
    required this.alive,
    required this.dead,
    required this.unknown,
    required this.secondaryText,
  });

  final Color alive;
  final Color dead;
  final Color unknown;
  final Color secondaryText;

  @override
  AppStatusColors copyWith({
    Color? alive,
    Color? dead,
    Color? unknown,
    Color? secondaryText,
  }) => AppStatusColors(
    alive: alive ?? this.alive,
    dead: dead ?? this.dead,
    unknown: unknown ?? this.unknown,
    secondaryText: secondaryText ?? this.secondaryText,
  );

  @override
  AppStatusColors lerp(ThemeExtension<AppStatusColors>? other, double t) {
    if (other is! AppStatusColors) return this;
    return AppStatusColors(
      alive: Color.lerp(alive, other.alive, t)!,
      dead: Color.lerp(dead, other.dead, t)!,
      unknown: Color.lerp(unknown, other.unknown, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
    );
  }
}

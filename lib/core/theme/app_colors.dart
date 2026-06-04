import 'package:flutter/material.dart';

/// Centralized colour palette derived from the Figma designs.
abstract final class AppColors {
  const AppColors._();

  // Brand
  static const Color accent = Color(
    0xFF21A0BA,
  ); // teal — play button, active tab
  static const Color accentDark = Color(0xFF2BB6D1);

  // Status
  static const Color alive = Color(0xFF49C96D);
  static const Color dead = Color(0xFFE05A4F);
  static const Color unknownStatus = Color(0xFF9E9E9E);

  // Light theme surfaces
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF2F4F5);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF1A1A1A);
  static const Color lightTextSecondary = Color(0xFF9CA3AF);
  static const Color lightDivider = Color(0xFFEDEFF1);

  // Dark theme surfaces
  static const Color darkBackground = Color(0xFF121417);
  static const Color darkSurface = Color(0xFF1C1F24);
  static const Color darkCard = Color(0xFF1C1F24);
  static const Color darkTextPrimary = Color(0xFFF5F6F7);
  static const Color darkTextSecondary = Color(0xFF8A9099);
  static const Color darkDivider = Color(0xFF2A2E34);
}

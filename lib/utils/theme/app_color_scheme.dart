import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Central Material 3 ColorScheme definitions for Sellora POS.
class AppColorScheme {
  AppColorScheme._();

  // ============================================================
  // LIGHT COLOR SCHEME
  // ============================================================

  static const ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,
    // Primary brand tokens
    primary: AppColors.primary,
    onPrimary: AppColors.textOnPrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.primaryDark,
    // Secondary brand tokens
    secondary: AppColors.primaryDark,
    onSecondary: AppColors.textOnPrimary,
    secondaryContainer: AppColors.primaryLight,
    onSecondaryContainer: AppColors.primaryDark,
    // Surface hierarchy
    surface: AppColors.surfaceBackground,
    onSurface: AppColors.textPrimary,
    onSurfaceVariant: AppColors.textSecondary,
    surfaceContainerLowest: AppColors.cardSurface,
    surfaceContainerLow: AppColors.surfaceBackground,
    surfaceContainer: AppColors.containerLow,
    surfaceContainerHigh: AppColors.containerLow,
    surfaceContainerHighest: AppColors.primaryLight,
    // Borders & Hairlines
    outline: AppColors.border,
    outlineVariant: AppColors.borderSubtle,
    // Semantics / Errors
    error: AppColors.error,
    onError: AppColors.cardSurface,
    errorContainer: AppColors.errorBg,
    onErrorContainer: AppColors.error,
    // Inverses
    inverseSurface: AppColors.textPrimary,
    onInverseSurface: AppColors.cardSurface,
    inversePrimary: AppColors.primaryLight,
    // Tint & Scrim
    surfaceTint: Colors.transparent,
    scrim: AppColors.textPrimary,
  );

  // ============================================================
  // DARK COLOR SCHEME (Prepared for Dark Theme support)
  // ============================================================

  static const ColorScheme darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF8B7EFA),
    onPrimary: Color(0xFF1E1B4B),
    primaryContainer: Color(0xFF3730A3),
    onPrimaryContainer: Color(0xFFEDE9FE),
    secondary: Color(0xFFA5B4FC),
    onSecondary: Color(0xFF1E1B4B),
    secondaryContainer: Color(0xFF312E81),
    onSecondaryContainer: Color(0xFFE0E7FF),
    surface: Color(0xFF0F172A),
    onSurface: Color(0xFFF8FAFC),
    onSurfaceVariant: Color(0xFF94A3B8),
    surfaceContainerLowest: Color(0xFF020617),
    surfaceContainerLow: Color(0xFF0F172A),
    surfaceContainer: Color(0xFF1E293B),
    surfaceContainerHigh: Color(0xFF334155),
    surfaceContainerHighest: Color(0xFF475569),
    outline: Color(0xFF334155),
    outlineVariant: Color(0xFF1E293B),
    error: Color(0xFFF87171),
    onError: Color(0xFF450A0A),
    errorContainer: Color(0xFF7F1D1D),
    onErrorContainer: Color(0xFFFECACA),
    inverseSurface: Color(0xFFF8FAFC),
    onInverseSurface: Color(0xFF0F172A),
    inversePrimary: AppColors.primary,
    surfaceTint: Colors.transparent,
    scrim: Colors.black,
  );
}

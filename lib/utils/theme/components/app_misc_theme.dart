import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_typography.dart';

/// Centralized Material 3 Theme configurations for Radio, Dividers, Progress Indicators, SnackBars, Popups, and Tooltips.
class AppMiscTheme {
  AppMiscTheme._();

  /// Radio Theme
  static RadioThemeData get radioTheme => RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primary;
      }
      return AppColors.textMuted;
    }),
  );

  /// Divider Theme
  static DividerThemeData get dividerTheme => const DividerThemeData(
    color: AppColors.border,
    thickness: AppDimensions.borderWidth,
    space: 1.0,
  );

  /// Progress Indicator Theme
  static ProgressIndicatorThemeData get progressIndicatorTheme =>
      const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.primaryLight,
        circularTrackColor: AppColors.primaryLight,
      );

  /// Popup Menu Theme
  static PopupMenuThemeData get popupMenuTheme => PopupMenuThemeData(
    color: AppColors.cardSurface,
    surfaceTintColor: Colors.transparent,
    elevation: 4,
    shadowColor: const Color(0x140F172A),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
      side: const BorderSide(
        color: AppColors.border,
        width: AppDimensions.borderWidth,
      ),
    ),
    textStyle: AppTypography.bodyLarge,
  );

  /// SnackBar Theme
  static SnackBarThemeData get snackBarTheme => SnackBarThemeData(
    backgroundColor: AppColors.textPrimary,
    contentTextStyle: AppTypography.bodyLarge.copyWith(
      color: AppColors.textOnPrimary,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
    ),
    behavior: SnackBarBehavior.floating,
  );

  /// Tooltip Theme
  static TooltipThemeData get tooltipTheme => TooltipThemeData(
    decoration: BoxDecoration(
      color: AppColors.textPrimary,
      borderRadius: BorderRadius.circular(AppDimensions.radiusXS),
    ),
    textStyle: AppTypography.bodySmall.copyWith(
      color: AppColors.textOnPrimary,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: AppDimensions.spacingMD,
      vertical: AppDimensions.spacingXS + 2,
    ),
  );

  /// Badge Theme
  static BadgeThemeData get badgeTheme => BadgeThemeData(
    backgroundColor: AppColors.primary,
    textColor: AppColors.textOnPrimary,
    textStyle: AppTypography.badge,
    padding: const EdgeInsets.symmetric(
      horizontal: AppDimensions.spacingXS + 2,
      vertical: 2,
    ),
  );
}

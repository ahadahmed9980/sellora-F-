import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';

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
    textStyle: GoogleFonts.sora(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    ),
  );

  /// SnackBar Theme
  static SnackBarThemeData get snackBarTheme => SnackBarThemeData(
    backgroundColor: AppColors.textPrimary,
    contentTextStyle: GoogleFonts.sora(
      fontSize: 14,
      fontWeight: FontWeight.w400,
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
    textStyle: GoogleFonts.sora(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textOnPrimary,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  );

  /// Badge Theme
  static BadgeThemeData get badgeTheme => BadgeThemeData(
    backgroundColor: AppColors.primary,
    textColor: AppColors.textOnPrimary,
    textStyle: GoogleFonts.sora(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.4,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
  );
}

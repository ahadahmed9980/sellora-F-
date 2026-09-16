import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';

/// Centralized Material 3 Button Themes for Sellora POS.
class AppButtonsTheme {
  AppButtonsTheme._();

  /// Elevated Button Theme (Primary CTA)
  static ElevatedButtonThemeData get elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          disabledBackgroundColor: AppColors.containerLow,
          disabledForegroundColor: AppColors.textDisabled,
          elevation: 0,
          shadowColor: Colors.transparent,
          minimumSize: const Size.fromHeight(AppDimensions.primaryButtonHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: const StadiumBorder(),
          textStyle: GoogleFonts.sora(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.20,
            letterSpacing: 0.1,
          ),
        ),
      );

  /// Filled Button Theme
  static FilledButtonThemeData get filledButtonTheme => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      disabledBackgroundColor: AppColors.containerLow,
      disabledForegroundColor: AppColors.textDisabled,
      elevation: 0,
      minimumSize: const Size.fromHeight(AppDimensions.primaryButtonHeight),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: const StadiumBorder(),
      textStyle: GoogleFonts.sora(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.20,
        letterSpacing: 0.1,
      ),
    ),
  );

  /// Outlined Button Theme (Secondary / Ghost)
  static OutlinedButtonThemeData get outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.cardSurface,
          foregroundColor: AppColors.textSecondary,
          disabledBackgroundColor: AppColors.containerLow,
          disabledForegroundColor: AppColors.textDisabled,
          elevation: 0,
          minimumSize: const Size.fromHeight(
            AppDimensions.secondaryButtonHeight,
          ),
          side: const BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderWidth,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: const StadiumBorder(),
          textStyle: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      );

  /// Text Button Theme
  static TextButtonThemeData get textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.textDisabled,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: const StadiumBorder(),
      textStyle: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  );

  /// Icon Button Theme
  static IconButtonThemeData get iconButtonTheme => IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: AppColors.textSecondary,
      disabledForegroundColor: AppColors.textDisabled,
      hoverColor: AppColors.primaryLight,
      highlightColor: AppColors.primaryLight,
      iconSize: AppDimensions.iconRegular,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
      ),
    ),
  );

  /// Floating Action Button Theme
  static FloatingActionButtonThemeData get floatingActionButtonTheme =>
      FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        ),
      );
}

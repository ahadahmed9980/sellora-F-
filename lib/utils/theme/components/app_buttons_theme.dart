import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_typography.dart';

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
          shadowColor: Colors.black,
          minimumSize: const Size.fromHeight(AppDimensions.primaryButtonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingXXL,
            vertical: 14,
          ),
          shape: const StadiumBorder(),
          textStyle: AppTypography.button,
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
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingXXL,
        vertical: 14,
      ),
      shape: const StadiumBorder(),
      textStyle: AppTypography.button,
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
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingXL,
            vertical: AppDimensions.spacingMD,
          ),
          shape: const StadiumBorder(),
          textStyle: AppTypography.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  /// Text Button Theme
  static TextButtonThemeData get textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.textDisabled,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingLG,
        vertical: AppDimensions.spacingSM,
      ),
      shape: const StadiumBorder(),
      textStyle: AppTypography.bodyLarge.copyWith(
        fontWeight: FontWeight.w600,
      ),
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

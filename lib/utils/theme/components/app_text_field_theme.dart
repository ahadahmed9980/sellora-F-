import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_typography.dart';

/// Centralized Material 3 TextField / InputDecoration Theme for Sellora POS.
class AppTextFieldTheme {
  AppTextFieldTheme._();

  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: AppColors.cardSurface,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppDimensions.spacingLG,
      vertical: 16.0,
    ),
    hintStyle: AppTypography.bodyMedium.copyWith(
      color: AppColors.textMuted,
    ),
    labelStyle: AppTypography.bodyMedium.copyWith(
      color: AppColors.textSecondary,
    ),
    floatingLabelStyle: AppTypography.bodySmall.copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
    errorStyle: AppTypography.bodySmall.copyWith(
      color: AppColors.error,
    ),
    prefixIconColor: AppColors.textMuted,
    suffixIconColor: AppColors.textMuted,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
      borderSide: const BorderSide(
        color: AppColors.border,
        width: AppDimensions.borderWidth,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
      borderSide: const BorderSide(
        color: AppColors.border,
        width: AppDimensions.borderWidth,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: AppDimensions.borderWidthFocused,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
      borderSide: const BorderSide(
        color: AppColors.error,
        width: AppDimensions.borderWidthFocused,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
      borderSide: const BorderSide(
        color: AppColors.error,
        width: AppDimensions.borderWidthFocused,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
      borderSide: const BorderSide(
        color: AppColors.borderSubtle,
        width: AppDimensions.borderWidth,
      ),
    ),
  );
}

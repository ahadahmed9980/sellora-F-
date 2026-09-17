import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_typography.dart';

/// Centralized Material 3 Chip Theme for Sellora POS.
class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData get chipTheme => ChipThemeData(
    backgroundColor: AppColors.containerLow,
    selectedColor: AppColors.primaryLight,
    disabledColor: AppColors.containerLow,
    labelStyle: AppTypography.bodyMedium.copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
    secondaryLabelStyle: AppTypography.bodyMedium.copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: AppDimensions.spacingMD,
      vertical: AppDimensions.spacingSM,
    ),
    shape: const StadiumBorder(),
    side: BorderSide.none,
    elevation: 0,
    pressElevation: 0,
  );
}

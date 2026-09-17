import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_typography.dart';

/// Centralized Material 3 Dialog Theme for Sellora POS.
class AppDialogTheme {
  AppDialogTheme._();

  static DialogThemeData get dialogTheme => DialogThemeData(
    backgroundColor: AppColors.cardSurface,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
      side: const BorderSide(
        color: AppColors.border,
        width: AppDimensions.borderWidth,
      ),
    ),
    titleTextStyle: AppTypography.h1,
    contentTextStyle: AppTypography.bodyLarge.copyWith(
      color: AppColors.textSecondary,
    ),
    insetPadding: const EdgeInsets.symmetric(
      horizontal: AppDimensions.spacingXL,
      vertical: AppDimensions.spacingXXL,
    ),
  );
}

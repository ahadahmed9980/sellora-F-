import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';

/// Centralized Material 3 Card Theme for Sellora POS.
class AppCardTheme {
  AppCardTheme._();

  static CardThemeData get cardTheme => CardThemeData(
    color: AppColors.cardSurface,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    shadowColor: Colors.transparent,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
      side: const BorderSide(
        color: AppColors.border,
        width: AppDimensions.borderWidth,
      ),
    ),
  );
}

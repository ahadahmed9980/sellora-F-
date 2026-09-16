import 'package:flutter/material.dart';

import '../app_colors.dart';

/// Centralized Material 3 Checkbox Theme for Sellora POS.
class AppCheckboxTheme {
  AppCheckboxTheme._();

  static CheckboxThemeData get checkboxTheme => CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primary;
      }
      return AppColors.cardSurface;
    }),
    checkColor: WidgetStateProperty.all(AppColors.textOnPrimary),
    side: const BorderSide(color: AppColors.border, width: 1.5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}

import 'package:flutter/material.dart';

import '../app_colors.dart';

/// Centralized Material 3 Switch Theme for Sellora POS.
class AppSwitchTheme {
  AppSwitchTheme._();

  static SwitchThemeData get switchTheme => SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.cardSurface;
      }
      return AppColors.textMuted;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primary;
      }
      return AppColors.containerLow;
    }),
    trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
  );
}

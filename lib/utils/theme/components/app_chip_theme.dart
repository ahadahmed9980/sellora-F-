import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

/// Centralized Material 3 Chip Theme for Sellora POS.
class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData get chipTheme => ChipThemeData(
    backgroundColor: AppColors.containerLow,
    selectedColor: AppColors.primaryLight,
    disabledColor: AppColors.containerLow,
    labelStyle: GoogleFonts.sora(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
    secondaryLabelStyle: GoogleFonts.sora(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    shape: const StadiumBorder(),
    side: BorderSide.none,
    elevation: 0,
    pressElevation: 0,
  );
}

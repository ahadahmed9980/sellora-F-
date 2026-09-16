import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';

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
    titleTextStyle: GoogleFonts.sora(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.25,
      letterSpacing: -0.3,
      color: AppColors.textPrimary,
    ),
    contentTextStyle: GoogleFonts.sora(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.45,
      color: AppColors.textSecondary,
    ),
    insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
  );
}

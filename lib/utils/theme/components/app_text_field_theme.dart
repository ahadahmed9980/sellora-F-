import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';

/// Centralized Material 3 TextField / InputDecoration Theme for Sellora POS.
class AppTextFieldTheme {
  AppTextFieldTheme._();

  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: AppColors.cardSurface,
    contentPadding: AppDimensions.inputPadding,
    hintStyle: GoogleFonts.sora(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textMuted,
    ),
    labelStyle: GoogleFonts.sora(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    ),
    floatingLabelStyle: GoogleFonts.sora(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
    prefixIconColor: AppColors.textMuted,
    suffixIconColor: AppColors.textMuted,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
      borderSide: const BorderSide(
        color: AppColors.border,
        width: AppDimensions.borderWidth,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
      borderSide: const BorderSide(
        color: AppColors.border,
        width: AppDimensions.borderWidth,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: AppDimensions.borderWidthFocused,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
      borderSide: const BorderSide(
        color: AppColors.error,
        width: AppDimensions.borderWidthFocused,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
      borderSide: const BorderSide(
        color: AppColors.error,
        width: AppDimensions.borderWidthFocused,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
      borderSide: const BorderSide(
        color: AppColors.borderSubtle,
        width: AppDimensions.borderWidth,
      ),
    ),
  );
}

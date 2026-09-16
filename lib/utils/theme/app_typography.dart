import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Central typography definitions and Material 3 TextTheme builders for Sellora POS.
class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Sora';

  // ============================================================
  // TYPOGRAPHY / TEXT STYLES (Sora Sans-Serif)
  // ============================================================

  /// Display Large: 32px, Bold (700), height: 1.15, letterSpacing: -0.8
  static TextStyle get displayLarge => GoogleFonts.sora(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 1.15,
    letterSpacing: -0.8,
    color: AppColors.textPrimary,
  );

  /// Display Medium: 26px, Bold (700), height: 1.20, letterSpacing: -0.5
  static TextStyle get displayMedium => GoogleFonts.sora(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.20,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  /// H1 (Screen Title): 20px, Bold (700), height: 1.25, letterSpacing: -0.3
  static TextStyle get h1 => GoogleFonts.sora(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: -0.3,
    color: AppColors.textPrimary,
  );

  /// H2 (Section Header): 16px, SemiBold (600), height: 1.30, letterSpacing: -0.2
  static TextStyle get h2 => GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.30,
    letterSpacing: -0.2,
    color: AppColors.textPrimary,
  );

  /// H3 (Card Title / Name): 15px, SemiBold (600), height: 1.35
  static TextStyle get h3 => GoogleFonts.sora(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.35,
    color: AppColors.textPrimary,
  );

  /// Body Large: 14px, Regular (400), height: 1.45
  static TextStyle get bodyLarge => GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: AppColors.textPrimary,
  );

  /// Body Medium: 13px, Regular (400), height: 1.40
  static TextStyle get bodyMedium => GoogleFonts.sora(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.40,
    color: AppColors.textSecondary,
  );

  /// Body Small: 12px, Regular (400), height: 1.35
  static TextStyle get bodySmall => GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.35,
    color: AppColors.textMuted,
  );

  /// Button Text: 15px, SemiBold (600), height: 1.20, letterSpacing: +0.1
  static TextStyle get button => GoogleFonts.sora(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.20,
    letterSpacing: 0.1,
    color: AppColors.textOnPrimary,
  );

  /// Badge / Status Tag: 11px, Bold (700), height: 1.20, letterSpacing: +0.4
  static TextStyle get badge => GoogleFonts.sora(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 1.20,
    letterSpacing: 0.4,
  );

  /// Nav Label: 11px, Medium (500), height: 1.20
  static TextStyle get navLabel => GoogleFonts.sora(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.20,
    color: AppColors.textMuted,
  );

  /// Label Small: 11px, Bold (700), height: 1.20, letterSpacing: 0.4
  static TextStyle get labelSmall => GoogleFonts.sora(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 1.20,
    letterSpacing: 0.4,
  );

  /// Tabular Numbers (Big): 22px, Bold (700), height: 1.20, letterSpacing: -0.3
  static TextStyle get tabularBig => GoogleFonts.sora(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.20,
    letterSpacing: -0.3,
    fontFeatures: const [FontFeature.tabularFigures()],
    color: AppColors.textPrimary,
  );

  /// Tabular Numbers (Row): 15px, SemiBold (600), height: 1.25
  static TextStyle get tabularRow => GoogleFonts.sora(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.25,
    fontFeatures: const [FontFeature.tabularFigures()],
    color: AppColors.textPrimary,
  );

  // ============================================================
  // TEXT THEME CREATOR
  // ============================================================

  /// Constructs the complete Material 3 TextTheme mapped precisely to design guidelines.
  static TextTheme createTextTheme([ColorScheme? colorScheme]) {
    final textPrimary = colorScheme?.onSurface ?? AppColors.textPrimary;
    final textSecondary = colorScheme?.onSurfaceVariant ?? AppColors.textSecondary;

    return TextTheme(
      displayLarge: displayLarge.copyWith(color: textPrimary),
      displayMedium: displayMedium.copyWith(color: textPrimary),
      displaySmall: tabularBig.copyWith(color: textPrimary),
      headlineLarge: h1.copyWith(color: textPrimary),
      headlineMedium: GoogleFonts.sora(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: -0.2,
        color: textPrimary,
      ),
      headlineSmall: h2.copyWith(color: textPrimary),
      titleLarge: GoogleFonts.sora(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.25,
        letterSpacing: -0.2,
        color: textPrimary,
      ),
      titleMedium: GoogleFonts.sora(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.30,
        letterSpacing: -0.2,
        color: textPrimary,
      ),
      titleSmall: h3.copyWith(color: textPrimary),
      bodyLarge: bodyLarge.copyWith(color: textPrimary),
      bodyMedium: bodyMedium.copyWith(color: textSecondary),
      bodySmall: bodySmall,
      labelLarge: button,
      labelMedium: GoogleFonts.sora(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        height: 1.20,
        color: textSecondary,
      ),
      labelSmall: labelSmall,
    );
  }
}

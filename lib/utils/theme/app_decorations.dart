import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_radius.dart';
import 'app_shadows.dart';

/// Predefined reusable decorations across the Sellora POS app.
class AppDecorations {
  AppDecorations._();

  // ---------------------------------------------------------------------------
  // Scaffold & Screen Backgrounds
  // ---------------------------------------------------------------------------
  /// Light ambient scaffold gradient decoration
  static const BoxDecoration scaffoldGradient = BoxDecoration(
    gradient: AppColors.scaffoldGradient,
  );

  /// Soft vertical ambient gradient decoration
  static const BoxDecoration scaffoldSoftGradient = BoxDecoration(
    gradient: AppColors.scaffoldSoftGradient,
  );

  /// Radial ambient glow gradient decoration
  static const BoxDecoration scaffoldRadialGradient = BoxDecoration(
    gradient: AppColors.scaffoldRadialGradient,
  );

  // ---------------------------------------------------------------------------
  // Cards & Surfaces
  // ---------------------------------------------------------------------------
  /// Master white card decoration with hairline border & ambient shadow
  static BoxDecoration card = BoxDecoration(
    color: AppColors.cardSurface,
    borderRadius: AppRadius.xl,
    border: Border.all(
      color: AppColors.border,
      width: AppDimensions.borderWidthDefault,
    ),
    boxShadow: AppShadows.cardShadow,
  );

  /// Flat card with border but no elevation
  static BoxDecoration cardFlat = BoxDecoration(
    color: AppColors.cardSurface,
    borderRadius: AppRadius.xl,
    border: Border.all(
      color: AppColors.border,
      width: AppDimensions.borderWidthDefault,
    ),
  );

  /// Logo & Hero tile card decoration with soft purple glow shadow
  static BoxDecoration logoCard = BoxDecoration(
    color: AppColors.cardSurface,
    borderRadius: BorderRadius.circular(28),
    border: Border.all(
      color: AppColors.border,
      width: AppDimensions.borderWidthDefault,
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0x1A6D5DF6),
        blurRadius: 28,
        spreadRadius: 0,
        offset: Offset(0, 10),
      ),
      BoxShadow(
        color: Color(0x0A0F172A),
        blurRadius: 16,
        spreadRadius: 0,
        offset: Offset(0, 4),
      ),
    ],
  );

  /// Status badge & pill decoration
  static BoxDecoration pillBadge({
    Color backgroundColor = AppColors.primaryContainer,
    Color borderColor = const Color(0x1F6D5DF6),
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: AppRadius.pill,
      border: Border.all(
        color: borderColor,
        width: 1.0,
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// Central source of truth for all Sellora POS colors and gradients.
class AppColors {
  AppColors._();

  // ============================================================
  // COLORS
  // ============================================================

  // Brand Palette
  static const Color primary = Color(0xFF6D5DF6);
  static const Color primaryDark = Color(0xFF4F46E5);
  static const Color primaryLight = Color(0xFFEFF4FF);
  static const Color primaryContainer = Color(0xFFEDE9FE);
  static const Color grey = Color(0xFF787586);

  // Canvas & Surfaces
  static const Color surfaceBackground = Color(0xFFF8F9FF);
  static const Color cardSurface = Color(0xFFFFFFFF);
  static const Color containerLow = Color(0xFFF1F5F9);

  // Borders & Hairlines
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderSubtle = Color(0xFFCBD5E1);

  // Semantic Colors
  static const Color success = Color(0xFF10B981);
  static const Color successBg = Color(0xFFECFDF5);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningBg = Color(0xFFFFFBEB);
  static const Color error = Color(0xFFEF4444);
  static const Color errorBg = Color(0xFFFEF2F2);
  static const Color info = Color(0xFF0EA5E9);
  static const Color infoBg = Color(0xFFF0F9FF);

  // Typography Colors
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color textDisabled = Color(0xFFCBD5E1);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Ambient Halo Accents
  static const Color ambientHaloRing = Color(0x146D5DF6);
  static const Color ambientOrb = Color(0x1F8B5CF6);

  // ============================================================
  // GRADIENTS
  // ============================================================

  /// Primary button & brand gradient (#6D5DF6 -> #4F46E5)
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Light lavender ambient scaffold gradient
  static const LinearGradient scaffoldGradient = LinearGradient(
    colors: [Color(0xFFEDE9FE), Color(0xFFF5F4FF), Color(0xFFF8F9FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.45, 1.0],
  );

  /// Soft vertical ambient gradient
  static const LinearGradient scaffoldSoftGradient = LinearGradient(
    colors: [Color(0xFFF3F0FE), Color(0xFFF8F9FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Radial ambient glow gradient for hero / splash center
  static const RadialGradient scaffoldRadialGradient = RadialGradient(
    center: Alignment(0.0, -0.32),
    radius: 0.9,
    colors: [Color(0xFFE8E3FD), Color(0xFFF3F1FE), Color(0xFFF8F9FF)],
    stops: [0.0, 0.5, 1.0],
  );

  /// Splash screen vertical ambient gradient
  static const LinearGradient splashScreenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF5F3FF),
      Color(0xFFF1EEFF),
      Color(0xFFECE7FF),
      Color(0xFFE9E2FF),
      Color(0xFFE2D8FF),
      Color(0xFFD6C6FF),
    ],
    stops: [0.0, 0.20, 0.40, 0.58, 0.80, 1.0],
  );
}

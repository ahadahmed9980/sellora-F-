import 'package:flutter/material.dart';

/// Central source of truth for all Sellora POS colors defined in `design.md`.
class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------------
  // Brand Palette
  // ---------------------------------------------------------------------------
  /// Primary brand violet (#6D5DF6) - CTA start gradient, active icons, active tab pills, selected rings
  static const Color primary = Color(0xFF6D5DF6);

  /// Primary dark indigo (#4F46E5) - Primary CTA end gradient, focused borders, hero card gradient accents
  static const Color primaryDark = Color(0xFF4F46E5);

  /// Primary light (#EFF4FF) - Active nav tab container, soft avatar background, selected chip fill
  static const Color primaryLight = Color(0xFFEFF4FF);

  /// Primary light container (#EDE9FE) - Secondary highlight pills, soft icon background tiles
  static const Color primaryContainer = Color(0xFFEDE9FE);

  // ---------------------------------------------------------------------------
  // Canvas & Surfaces
  // ---------------------------------------------------------------------------
  /// Surface background (#F8F9FF) - Scaffold background, viewport background, anti-glare light canvas
  static const Color surfaceBackground = Color(0xFFF8F9FF);

  /// Card surface (#FFFFFF) - Master cards, bottom sheets, modal dialogs, input field fills
  static const Color cardSurface = Color(0xFFFFFFFF);

  /// Container low (#F1F5F9) - Search bar fill, inactive filter chips, quantity toggle backgrounds
  static const Color containerLow = Color(0xFFF1F5F9);

  // ---------------------------------------------------------------------------
  // Hairlines & Borders
  // ---------------------------------------------------------------------------
  /// Hairline border (#E2E8F0) - Card outlines, input inactive border, list item dividers, modal borders
  static const Color border = Color(0xFFE2E8F0);
  static const Color hairlineBorder = Color(0xFFE2E8F0);

  /// Subtle hairline (#CBD5E1) - Secondary dividers, disabled element borders, barcode line accents
  static const Color borderSubtle = Color(0xFFCBD5E1);
  static const Color hairlineSubtle = Color(0xFFCBD5E1);

  // ---------------------------------------------------------------------------
  // Semantic Colors
  // ---------------------------------------------------------------------------
  /// Success emerald (#10B981) - Payment received (+Rs), profit tags, in-stock pills, checkmarks
  static const Color success = Color(0xFF10B981);
  static const Color successEmerald = Color(0xFF10B981);

  /// Success background (#ECFDF5) - Emerald tag fill, positive profit indicator tile background
  static const Color successBg = Color(0xFFECFDF5);

  /// Warning amber (#F59E0B) - Due soon status, low-stock warnings, pending cash verification
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningAmber = Color(0xFFF59E0B);

  /// Warning background (#FFFBEB) - Amber warning chip fill, stock alert tile container
  static const Color warningBg = Color(0xFFFFFBEB);

  /// Error coral (#EF4444) - Overdue credit (-Rs), expense outflow, delete actions, stock out tags
  static const Color error = Color(0xFFEF4444);
  static const Color errorCoral = Color(0xFFEF4444);

  /// Error background (#FEF2F2) - Coral badge fill, destructive button hover/tap state
  static const Color errorBg = Color(0xFFFEF2F2);

  /// Info sky blue (#0EA5E9) - Digital receipt tags, cloud sync indicators, thermal preview badges
  static const Color info = Color(0xFF0EA5E9);
  static const Color infoSky = Color(0xFF0EA5E9);

  /// Info background (#F0F9FF) - Sky blue badge container, info tip banner background
  static const Color infoBg = Color(0xFFF0F9FF);

  // ---------------------------------------------------------------------------
  // Typography Colors
  // ---------------------------------------------------------------------------
  /// Slate 900 primary text (#0F172A) - Display titles, hero currency figures, customer names, primary labels
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color slate900 = Color(0xFF0F172A);

  /// Slate 600 secondary text (#475569) - Subtitles, receipt item counts, section descriptions, invoice dates
  static const Color textSecondary = Color(0xFF475569);
  static const Color slate600 = Color(0xFF475569);

  /// Slate 400 muted/hint text (#94A3B8) - Input placeholders, inactive bottom nav icons, helper text
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color slate400 = Color(0xFF94A3B8);

  /// Slate 300 disabled text (#CBD5E1) - Disabled CTA text, inactive icons, disabled button borders
  static const Color textDisabled = Color(0xFFCBD5E1);
  static const Color slate300 = Color(0xFFCBD5E1);

  /// White text on primary (#FFFFFF) - Text on primary gradient buttons, active bottom nav capsule labels
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  /// Ambient glow & halo accents
  static const Color ambientHaloRing = Color(0x146D5DF6);
  static const Color ambientOrb = Color(0x1F8B5CF6);

  // ---------------------------------------------------------------------------
  // Gradients
  // ---------------------------------------------------------------------------
  /// Primary button & brand gradient (#6D5DF6 -> #4F46E5)
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Light lavender ambient scaffold gradient (as seen on Splash & Hero screens)
  /// (#EDE9FE -> #F5F4FF -> #F8F9FF)
  static const LinearGradient scaffoldGradient = LinearGradient(
    colors: [
      Color(0xFFEDE9FE),
      Color(0xFFF5F4FF),
      Color(0xFFF8F9FF),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.45, 1.0],
  );

  /// Soft vertical ambient gradient
  static const LinearGradient scaffoldSoftGradient = LinearGradient(
    colors: [
      Color(0xFFF3F0FE),
      Color(0xFFF8F9FF),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Radial ambient glow gradient for hero / splash center
  static const RadialGradient scaffoldRadialGradient = RadialGradient(
    center: Alignment(0.0, -0.32),
    radius: 0.9,
    colors: [
      Color(0xFFE8E3FD),
      Color(0xFFF3F1FE),
      Color(0xFFF8F9FF),
    ],
    stops: [0.0, 0.5, 1.0],
  );
}


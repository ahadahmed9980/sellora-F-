import 'package:flutter/material.dart';

/// Central source of truth for all Sellora POS BoxShadow and elevation specs defined in `design.md`.
class AppShadows {
  AppShadows._();

  // ---------------------------------------------------------------------------
  // Card Shadow (Diffuse Ambient)
  // ---------------------------------------------------------------------------
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x0A0F172A), // rgba(15, 23, 42, 0.04)
      blurRadius: 16,
      spreadRadius: 0,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x086D5DF6), // rgba(109, 93, 246, 0.03)
      blurRadius: 24,
      spreadRadius: -4,
      offset: Offset(0, 8),
    ),
  ];

  // ---------------------------------------------------------------------------
  // Primary CTA Button Glow
  // ---------------------------------------------------------------------------
  static const List<BoxShadow> buttonGlow = [
    BoxShadow(
      color: Color(0x596D5DF6), // rgba(109, 93, 246, 0.35)
      blurRadius: 18,
      spreadRadius: 0,
      offset: Offset(0, 6),
    ),
  ];

  // ---------------------------------------------------------------------------
  // Docked POS Navigation Bar Top Shadow
  // ---------------------------------------------------------------------------
  static const List<BoxShadow> bottomNavShadow = [
    BoxShadow(
      color: Color(0x0D0F172A), // rgba(15, 23, 42, 0.05)
      blurRadius: 24,
      spreadRadius: 0,
      offset: Offset(0, -4),
    ),
  ];

  // ---------------------------------------------------------------------------
  // Modal Dialog & Bottom Sheet Elevation
  // ---------------------------------------------------------------------------
  static const List<BoxShadow> modalShadow = [
    BoxShadow(
      color: Color(0x1A0F172A), // rgba(15, 23, 42, 0.10)
      blurRadius: 32,
      spreadRadius: 0,
      offset: Offset(0, 12),
    ),
  ];
}

import 'package:flutter/material.dart';

/// Centralized dimensions, radius, spacing, and shadow tokens for Sellora POS.
class AppDimensions {
  AppDimensions._();

  // ============================================================
  // RADIUS (Numeric values)
  // ============================================================

  /// 6px - Tiny micro-badges, stock level indicator dots
  static const double radiusXS = 6.0;

  /// 10px - Category icon tiles, quantity toggle steppers
  static const double radiusSM = 10.0;

  /// 14px - Text input fields, dropdown menus, product thumbnail tiles
  static const double radiusMD = 14.0;

  /// 18px - Transaction ledger rows, secondary metric cards
  static const double radiusLG = 18.0;

  /// 24px - Master white cards, modal dialogs, bottom sheet top edges
  static const double radiusXL = 24.0;

  /// 999px - Primary CTA buttons, filter chips, search bars, nav pills
  static const double radiusPill = 999.0;

  // ============================================================
  // SPACING
  // ============================================================

  /// 4px - Badge internal padding, icon-to-badge gap
  static const double spacingXS = 4.0;

  /// 8px - Icon-to-text spacing, compact chip gaps
  static const double spacingSM = 8.0;

  /// 12px - Card internal row padding, list item gaps
  static const double spacingMD = 12.0;

  /// 16px - Standard screen horizontal padding, card padding
  static const double spacingLG = 16.0;

  /// 20px - Hero balance card internal padding, section gap
  static const double spacingXL = 20.0;

  /// 24px - Major vertical section separation
  static const double spacingXXL = 24.0;

  /// 32px - Top header spacing, modal top inset
  static const double spacingXXXL = 32.0;

  /// 80px - Bottom scroll inset preventing docked bar overlap
  static const double bottomNavInset = 80.0;

  // ============================================================
  // SPACING INSETS
  // ============================================================

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: spacingLG,
  );
  static const EdgeInsets screenInsets = EdgeInsets.symmetric(
    horizontal: spacingLG,
    vertical: spacingLG,
  );
  static const EdgeInsets cardPadding = EdgeInsets.all(spacingLG);
  static const EdgeInsets heroCardPadding = EdgeInsets.all(spacingXL);
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: spacingLG,
    vertical: 14.0,
  );
  static const EdgeInsets bottomScrollInset = EdgeInsets.only(
    bottom: bottomNavInset,
  );

  // ============================================================
  // DIMENSIONS
  // ============================================================

  /// 54px - Primary CTA Button height
  static const double primaryButtonHeight = 54.0;

  /// 48px - Secondary / Ghost Button height
  static const double secondaryButtonHeight = 48.0;

  /// 44px - Compact Ghost Button / Stepper height
  static const double secondaryButtonHeightCompact = 44.0;

  /// 52px - Standard Text Input Field height
  static const double inputHeight = 52.0;

  /// 44px - Search Field (POS Catalog & History) height
  static const double searchFieldHeight = 44.0;

  /// 60px - Top App Bar height (excluding status bar)
  static const double appBarHeight = 60.0;

  /// 68px - Docked POS Bottom Navigation Bar height
  static const double bottomNavHeight = 68.0;

  /// 24px - Status Pill / Badge height
  static const double statusBadgeHeight = 24.0;

  /// 56px - Product Catalog Thumbnail size (56x56)
  static const double productImageSize = 56.0;

  /// 40px - Customer Avatar size (40x40)
  static const double avatarSize = 40.0;

  /// 16px - Small / Inline Status Icon
  static const double iconSmall = 16.0;

  /// 20px - Regular Row / Field / Action Icon
  static const double iconRegular = 20.0;

  /// 24px - Bottom Navigation Icon
  static const double iconNav = 24.0;

  /// 40px–48px - Hero Card Illustration Tile Icon
  static const double iconHero = 48.0;

  /// 1.0px - Standard hairline border width
  static const double borderWidth = 1.0;
  static const double borderWidthDefault = 1.0;

  /// 1.5px - Focused & error input border width
  static const double borderWidthFocused = 1.5;

  // ============================================================
  // SHADOWS
  // ============================================================

  /// Diffuse ambient card shadow
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x0A0F172A),
      blurRadius: 16,
      spreadRadius: 0,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x086D5DF6),
      blurRadius: 24,
      spreadRadius: -4,
      offset: Offset(0, 8),
    ),
  ];

  /// Primary CTA button glow
  static const List<BoxShadow> buttonGlow = [
    BoxShadow(
      color: Color(0x596D5DF6),
      blurRadius: 18,
      spreadRadius: 0,
      offset: Offset(0, 6),
    ),
  ];

  /// Docked POS navigation bar top shadow
  static const List<BoxShadow> bottomNavShadow = [
    BoxShadow(
      color: Color(0x0D0F172A),
      blurRadius: 24,
      spreadRadius: 0,
      offset: Offset(0, -4),
    ),
  ];

  /// Modal dialog & bottom sheet elevation shadow
  static const List<BoxShadow> modalShadow = [
    BoxShadow(
      color: Color(0x1A0F172A),
      blurRadius: 32,
      spreadRadius: 0,
      offset: Offset(0, 12),
    ),
  ];
}

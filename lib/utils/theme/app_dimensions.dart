/// Central source of truth for component dimensions defined in `design.md`.
class AppDimensions {
  AppDimensions._();

  // ---------------------------------------------------------------------------
  // Button Heights
  // ---------------------------------------------------------------------------
  /// 54px - Primary CTA Button height
  static const double primaryButtonHeight = 54.0;

  /// 48px - Secondary / Ghost Button height
  static const double secondaryButtonHeight = 48.0;

  /// 44px - Compact Ghost Button / Stepper height
  static const double secondaryButtonHeightCompact = 44.0;

  // ---------------------------------------------------------------------------
  // Input Heights & Metrics
  // ---------------------------------------------------------------------------
  /// 52px - Standard Text Input Field height
  static const double inputHeight = 52.0;

  /// 44px - Search Field (POS Catalog & History) height
  static const double searchFieldHeight = 44.0;

  // ---------------------------------------------------------------------------
  // Bars & Headers
  // ---------------------------------------------------------------------------
  /// 60px - Top App Bar height (excluding status bar)
  static const double appBarHeight = 60.0;

  /// 68px - Docked POS Bottom Navigation Bar height
  static const double bottomNavHeight = 68.0;

  // ---------------------------------------------------------------------------
  // Component Sizes
  // ---------------------------------------------------------------------------
  /// 24px - Status Pill / Badge height
  static const double statusBadgeHeight = 24.0;

  /// 56px - Product Catalog Thumbnail size (56x56)
  static const double productImageSize = 56.0;

  /// 40px - Customer Avatar size (40x40)
  static const double avatarSize = 40.0;

  // ---------------------------------------------------------------------------
  // Icon Sizes
  // ---------------------------------------------------------------------------
  /// 16px - Small / Inline Status Icon
  static const double iconSmall = 16.0;

  /// 20px - Regular Row / Field / Action Icon
  static const double iconRegular = 20.0;

  /// 24px - Bottom Navigation Icon
  static const double iconNav = 24.0;

  /// 40px–48px - Hero Card Illustration Tile Icon
  static const double iconHero = 48.0;

  // ---------------------------------------------------------------------------
  // Border Widths
  // ---------------------------------------------------------------------------
  /// 1.0px - Standard hairline border width
  static const double borderWidthDefault = 1.0;

  /// 1.5px - Focused & error input border width
  static const double borderWidthFocused = 1.5;
}

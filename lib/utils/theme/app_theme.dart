import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color_scheme.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_typography.dart';
import 'components/app_bottom_sheet_theme.dart';
import 'components/app_buttons_theme.dart';
import 'components/app_card_theme.dart';
import 'components/app_checkbox_theme.dart';
import 'components/app_chip_theme.dart';
import 'components/app_dialog_theme.dart';
import 'components/app_misc_theme.dart';
import 'components/app_navigation_theme.dart';
import 'components/app_switch_theme.dart';
import 'components/app_text_field_theme.dart';

// Export all theme modules for convenient single-import usage across the app.
export 'app_color_scheme.dart';
export 'app_colors.dart';
export 'app_dimensions.dart';
export 'app_typography.dart';
export 'components/app_bottom_sheet_theme.dart';
export 'components/app_buttons_theme.dart';
export 'components/app_card_theme.dart';
export 'components/app_checkbox_theme.dart';
export 'components/app_chip_theme.dart';
export 'components/app_dialog_theme.dart';
export 'components/app_misc_theme.dart';
export 'components/app_navigation_theme.dart';
export 'components/app_switch_theme.dart';
export 'components/app_text_field_theme.dart';

/// Central theme configuration for the Sellora POS application.
///
/// Architecture:
/// ```
/// AppTheme
///    ↓
/// ThemeData / ColorScheme
///    ↓
/// Material 3 Components
///    ├── Buttons (AppButtonsTheme)
///    ├── TextFields (AppTextFieldTheme)
///    ├── Cards (AppCardTheme)
///    ├── Dialogs (AppDialogTheme)
///    ├── Bottom Sheets (AppBottomSheetTheme)
///    ├── NavigationBar & Bars (AppNavigationTheme)
///    ├── Chips (AppChipTheme)
///    ├── Checkboxes (AppCheckboxTheme)
///    ├── Switches (AppSwitchTheme)
///    └── etc. (AppMiscTheme: Radio, Divider, ProgressIndicator, SnackBar, Popup, Tooltip, Badge)
/// ```
class AppTheme {
  AppTheme._();

  // ============================================================
  // RADIUS ALIASES (Backward Compatibility with AppDimensions)
  // ============================================================
  static const double radiusXS = AppDimensions.radiusXS;
  static const double radiusSM = AppDimensions.radiusSM;
  static const double radiusMD = AppDimensions.radiusMD;
  static const double radiusLG = AppDimensions.radiusLG;
  static const double radiusXL = AppDimensions.radiusXL;
  static const double radiusPill = AppDimensions.radiusPill;

  // ============================================================
  // SPACING ALIASES (Backward Compatibility with AppDimensions)
  // ============================================================
  static const double spacingXS = AppDimensions.spacingXS;
  static const double spacingSM = AppDimensions.spacingSM;
  static const double spacingMD = AppDimensions.spacingMD;
  static const double spacingLG = AppDimensions.spacingLG;
  static const double spacingXL = AppDimensions.spacingXL;
  static const double spacingXXL = AppDimensions.spacingXXL;
  static const double spacingXXXL = AppDimensions.spacingXXXL;
  static const double bottomNavInset = AppDimensions.bottomNavInset;

  // Spacing Insets Presets
  static const EdgeInsets screenPadding = AppDimensions.screenPadding;
  static const EdgeInsets screenInsets = AppDimensions.screenInsets;
  static const EdgeInsets cardPadding = AppDimensions.cardPadding;
  static const EdgeInsets heroCardPadding = AppDimensions.heroCardPadding;
  static const EdgeInsets inputPadding = AppDimensions.inputPadding;
  static const EdgeInsets bottomScrollInset = AppDimensions.bottomScrollInset;

  // ============================================================
  // DIMENSION ALIASES (Backward Compatibility with AppDimensions)
  // ============================================================
  static const double primaryButtonHeight = AppDimensions.primaryButtonHeight;
  static const double secondaryButtonHeight = AppDimensions.secondaryButtonHeight;
  static const double secondaryButtonHeightCompact = AppDimensions.secondaryButtonHeightCompact;
  static const double inputHeight = AppDimensions.inputHeight;
  static const double searchFieldHeight = AppDimensions.searchFieldHeight;
  static const double appBarHeight = AppDimensions.appBarHeight;
  static const double bottomNavHeight = AppDimensions.bottomNavHeight;
  static const double statusBadgeHeight = AppDimensions.statusBadgeHeight;
  static const double productImageSize = AppDimensions.productImageSize;
  static const double avatarSize = AppDimensions.avatarSize;
  static const double iconSmall = AppDimensions.iconSmall;
  static const double iconRegular = AppDimensions.iconRegular;
  static const double iconNav = AppDimensions.iconNav;
  static const double iconHero = AppDimensions.iconHero;
  static const double borderWidth = AppDimensions.borderWidth;
  static const double borderWidthDefault = AppDimensions.borderWidthDefault;
  static const double borderWidthFocused = AppDimensions.borderWidthFocused;

  // ============================================================
  // SHADOW ALIASES (Backward Compatibility with AppDimensions)
  // ============================================================
  static const List<BoxShadow> cardShadow = AppDimensions.cardShadow;
  static const List<BoxShadow> buttonGlow = AppDimensions.buttonGlow;
  static const List<BoxShadow> bottomNavShadow = AppDimensions.bottomNavShadow;
  static const List<BoxShadow> modalShadow = AppDimensions.modalShadow;

  // ============================================================
  // TYPOGRAPHY ALIASES (Backward Compatibility with AppTypography)
  // ============================================================
  static const String fontFamily = AppTypography.fontFamily;
  static TextStyle get displayLarge => AppTypography.displayLarge;
  static TextStyle get displayMedium => AppTypography.displayMedium;
  static TextStyle get h1 => AppTypography.h1;
  static TextStyle get h2 => AppTypography.h2;
  static TextStyle get h3 => AppTypography.h3;
  static TextStyle get bodyLarge => AppTypography.bodyLarge;
  static TextStyle get bodyMedium => AppTypography.bodyMedium;
  static TextStyle get bodySmall => AppTypography.bodySmall;
  static TextStyle get button => AppTypography.button;
  static TextStyle get badge => AppTypography.badge;
  static TextStyle get navLabel => AppTypography.navLabel;
  static TextStyle get labelSmall => AppTypography.labelSmall;
  static TextStyle get tabularBig => AppTypography.tabularBig;
  static TextStyle get tabularRow => AppTypography.tabularRow;

  static TextTheme createTextTheme([ColorScheme? colorScheme]) =>
      AppTypography.createTextTheme(colorScheme);

  // ============================================================
  // COLOR SCHEME ALIASES
  // ============================================================
  static const ColorScheme lightColorScheme = AppColorScheme.lightScheme;
  static const ColorScheme darkColorScheme = AppColorScheme.darkScheme;

  // ============================================================
  // MATERIAL 3 THEMEDATA BUILDERS
  // ============================================================

  /// Default application theme (Light)
  static ThemeData get theme => lightTheme;

  /// Light ThemeData assembled from modular component themes
  static ThemeData get lightTheme {
    return _buildTheme(
      colorScheme: AppColorScheme.lightScheme,
      scaffoldBgColor: AppColors.surfaceBackground,
    );
  }

  /// Dark ThemeData assembled from modular component themes
  static ThemeData get darkTheme {
    return _buildTheme(
      colorScheme: AppColorScheme.darkScheme,
      scaffoldBgColor: AppColorScheme.darkScheme.surface,
    );
  }

  /// Master theme builder assembling Material 3 components
  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required Color scaffoldBgColor,
  }) {
    final textTheme = AppTypography.createTextTheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBgColor,
      fontFamily: GoogleFonts.sora().fontFamily,
      textTheme: textTheme,

      // Component Themes
      // 1. Navigation (AppBar, Bottom Navigation Bar, TabBar, Drawer, NavigationRail)
      appBarTheme: AppNavigationTheme.appBarTheme,
      navigationBarTheme: AppNavigationTheme.navigationBarTheme,
      tabBarTheme: AppNavigationTheme.tabBarTheme,
      drawerTheme: AppNavigationTheme.drawerTheme,
      navigationDrawerTheme: AppNavigationTheme.navigationDrawerTheme,
      navigationRailTheme: AppNavigationTheme.navigationRailTheme,

      // 2. Cards
      cardTheme: AppCardTheme.cardTheme,

      // 3. Text Fields (Input Decoration)
      inputDecorationTheme: AppTextFieldTheme.inputDecorationTheme,

      // 4. Buttons (Elevated, Filled, Outlined, Text, Icon, FAB)
      elevatedButtonTheme: AppButtonsTheme.elevatedButtonTheme,
      filledButtonTheme: AppButtonsTheme.filledButtonTheme,
      outlinedButtonTheme: AppButtonsTheme.outlinedButtonTheme,
      textButtonTheme: AppButtonsTheme.textButtonTheme,
      iconButtonTheme: AppButtonsTheme.iconButtonTheme,
      floatingActionButtonTheme: AppButtonsTheme.floatingActionButtonTheme,

      // 5. Dialogs
      dialogTheme: AppDialogTheme.dialogTheme,

      // 6. Bottom Sheets
      bottomSheetTheme: AppBottomSheetTheme.bottomSheetTheme,

      // 7. Chips
      chipTheme: AppChipTheme.chipTheme,

      // 8. Selection Controls (Checkboxes, Switches, Radios)
      checkboxTheme: AppCheckboxTheme.checkboxTheme,
      switchTheme: AppSwitchTheme.switchTheme,
      radioTheme: AppMiscTheme.radioTheme,

      // 9. Feedback & Miscellaneous (Dividers, Progress, Menus, SnackBars, Tooltips, Badges)
      dividerTheme: AppMiscTheme.dividerTheme,
      progressIndicatorTheme: AppMiscTheme.progressIndicatorTheme,
      popupMenuTheme: AppMiscTheme.popupMenuTheme,
      snackBarTheme: AppMiscTheme.snackBarTheme,
      tooltipTheme: AppMiscTheme.tooltipTheme,
      badgeTheme: AppMiscTheme.badgeTheme,
      iconTheme: const IconThemeData(
        color: AppColors.textSecondary,
        size: AppDimensions.iconRegular,
      ),
    );
  }
}

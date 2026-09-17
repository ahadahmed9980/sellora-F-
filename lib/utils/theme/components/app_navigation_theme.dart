import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_typography.dart';

/// Centralized Material 3 Navigation Themes (NavigationBar, AppBar, TabBar, Drawer) for Sellora POS.
class AppNavigationTheme {
  AppNavigationTheme._();

  /// Docked 4-Tab POS Navigation Bar Theme
  static NavigationBarThemeData get navigationBarTheme =>
      NavigationBarThemeData(
        height: AppDimensions.bottomNavHeight,
        backgroundColor: AppColors.cardSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        indicatorColor: AppColors.primaryLight,
        indicatorShape: const StadiumBorder(),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTypography.navLabel.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            );
          }
          return AppTypography.navLabel;
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(
              color: AppColors.primary,
              size: AppDimensions.iconNav,
            );
          }
          return const IconThemeData(
            color: AppColors.textMuted,
            size: AppDimensions.iconNav,
          );
        }),
      );

  /// Top App Bar Theme
  static AppBarTheme get appBarTheme => AppBarTheme(
    backgroundColor: AppColors.surfaceBackground,
    foregroundColor: AppColors.textPrimary,
    elevation: 0,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    toolbarHeight: AppDimensions.appBarHeight,
    centerTitle: false,
    titleTextStyle: AppTypography.h1.copyWith(fontSize: 18),
    iconTheme: const IconThemeData(
      color: AppColors.textPrimary,
      size: AppDimensions.iconRegular,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.textPrimary,
      size: AppDimensions.iconRegular,
    ),
  );

  /// Tab Bar Theme
  static TabBarThemeData get tabBarTheme => TabBarThemeData(
    indicatorColor: AppColors.primary,
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: AppColors.primary,
    unselectedLabelColor: AppColors.textMuted,
    labelStyle: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600),
    unselectedLabelStyle: AppTypography.bodyLarge.copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.textMuted,
    ),
    dividerColor: AppColors.border,
  );

  /// Drawer Theme
  static DrawerThemeData get drawerTheme => DrawerThemeData(
    backgroundColor: AppColors.cardSurface,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(AppDimensions.radiusXL),
      ),
    ),
  );

  /// Navigation Drawer Theme
  static NavigationDrawerThemeData get navigationDrawerTheme =>
      NavigationDrawerThemeData(
        backgroundColor: AppColors.cardSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        indicatorColor: AppColors.primaryLight,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
        ),
      );

  /// Navigation Rail Theme
  static NavigationRailThemeData get navigationRailTheme =>
      NavigationRailThemeData(
        backgroundColor: AppColors.cardSurface,
        indicatorColor: AppColors.primaryLight,
        selectedIconTheme: const IconThemeData(
          color: AppColors.primary,
          size: AppDimensions.iconNav,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.textMuted,
          size: AppDimensions.iconNav,
        ),
        selectedLabelTextStyle: AppTypography.bodySmall.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        unselectedLabelTextStyle: AppTypography.bodySmall.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.textMuted,
        ),
      );
}

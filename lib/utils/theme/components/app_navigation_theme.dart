import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';

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
            return GoogleFonts.sora(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              height: 1.20,
              color: AppColors.primary,
            );
          }
          return GoogleFonts.sora(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            height: 1.20,
            color: AppColors.textMuted,
          );
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
    titleTextStyle: GoogleFonts.sora(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      letterSpacing: -0.3,
    ),
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
    labelStyle: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600),
    unselectedLabelStyle: GoogleFonts.sora(
      fontSize: 14,
      fontWeight: FontWeight.w500,
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
        selectedLabelTextStyle: GoogleFonts.sora(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        unselectedLabelTextStyle: GoogleFonts.sora(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textMuted,
        ),
      );
}

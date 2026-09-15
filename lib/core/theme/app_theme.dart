import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

export 'app_colors.dart';
export 'app_dimensions.dart';
export 'app_radius.dart';
export 'app_shadows.dart';
export 'app_spacing.dart';
export 'app_text_styles.dart';

/// Central theme configuration for the Sellora POS application.
/// Built strictly from `design.md` with Flutter Material 3 foundations.
class AppTheme {
  AppTheme._();

  // ---------------------------------------------------------------------------
  // Material 3 ColorScheme
  // ---------------------------------------------------------------------------
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    // Primary brand tokens
    primary: AppColors.primary,
    onPrimary: AppColors.textOnPrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.primaryDark,
    // Secondary brand tokens
    secondary: AppColors.primaryDark,
    onSecondary: AppColors.textOnPrimary,
    secondaryContainer: AppColors.primaryLight,
    onSecondaryContainer: AppColors.primaryDark,
    // Surface hierarchy
    surface: AppColors.surfaceBackground,
    onSurface: AppColors.textPrimary,
    onSurfaceVariant: AppColors.textSecondary,
    surfaceContainerLowest: AppColors.cardSurface,
    surfaceContainerLow: AppColors.surfaceBackground,
    surfaceContainer: AppColors.containerLow,
    surfaceContainerHigh: AppColors.containerLow,
    surfaceContainerHighest: AppColors.primaryLight,
    // Borders & Hairlines
    outline: AppColors.border,
    outlineVariant: AppColors.borderSubtle,
    // Semantics / Errors
    error: AppColors.error,
    onError: AppColors.cardSurface,
    errorContainer: AppColors.errorBg,
    onErrorContainer: AppColors.error,
    // Inverses
    inverseSurface: AppColors.textPrimary,
    onInverseSurface: AppColors.cardSurface,
    inversePrimary: AppColors.primaryLight,
    // Tint & Scrim
    surfaceTint: Colors.transparent,
    scrim: AppColors.textPrimary,
  );

  // ---------------------------------------------------------------------------
  // Light Theme Data
  // ---------------------------------------------------------------------------
  static ThemeData get lightTheme {
    final TextTheme textTheme = AppTextStyles.createTextTheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: AppColors.surfaceBackground,
      fontFamily: GoogleFonts.sora().fontFamily,
      textTheme: textTheme,

      // App Bar Theme
      appBarTheme: AppBarTheme(
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
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.cardSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.xl,
          side: const BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderWidthDefault,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardSurface,
        contentPadding: AppSpacing.inputPadding,
        hintStyle: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textMuted,
        ),
        labelStyle: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        floatingLabelStyle: GoogleFonts.sora(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        prefixIconColor: AppColors.textMuted,
        suffixIconColor: AppColors.textMuted,
        border: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderWidthDefault,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderWidthDefault,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: AppDimensions.borderWidthFocused,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(
            color: AppColors.error,
            width: AppDimensions.borderWidthFocused,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(
            color: AppColors.error,
            width: AppDimensions.borderWidthFocused,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.md,
          borderSide: const BorderSide(
            color: AppColors.borderSubtle,
            width: AppDimensions.borderWidthDefault,
          ),
        ),
      ),

      // Elevated Button Theme (Primary CTA)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          disabledBackgroundColor: AppColors.containerLow,
          disabledForegroundColor: AppColors.textDisabled,
          elevation: 0,
          shadowColor: Colors.transparent,
          minimumSize: const Size.fromHeight(AppDimensions.primaryButtonHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: const StadiumBorder(),
          textStyle: GoogleFonts.sora(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.20,
            letterSpacing: 0.1,
          ),
        ),
      ),

      // Filled Button Theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          disabledBackgroundColor: AppColors.containerLow,
          disabledForegroundColor: AppColors.textDisabled,
          elevation: 0,
          minimumSize: const Size.fromHeight(AppDimensions.primaryButtonHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: const StadiumBorder(),
          textStyle: GoogleFonts.sora(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.20,
            letterSpacing: 0.1,
          ),
        ),
      ),

      // Outlined Button Theme (Secondary / Ghost)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.cardSurface,
          foregroundColor: AppColors.textSecondary,
          disabledBackgroundColor: AppColors.containerLow,
          disabledForegroundColor: AppColors.textDisabled,
          elevation: 0,
          minimumSize: const Size.fromHeight(AppDimensions.secondaryButtonHeight),
          side: const BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderWidthDefault,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: const StadiumBorder(),
          textStyle: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.textDisabled,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: const StadiumBorder(),
          textStyle: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.textSecondary,
        size: AppDimensions.iconRegular,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: AppDimensions.borderWidthDefault,
        space: 1.0,
      ),

      // Navigation Bar Theme (Docked 4-Tab POS Bar)
      navigationBarTheme: NavigationBarThemeData(
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
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.cardSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.xl,
          side: const BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderWidthDefault,
          ),
        ),
        titleTextStyle: GoogleFonts.sora(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1.25,
          letterSpacing: -0.3,
          color: AppColors.textPrimary,
        ),
        contentTextStyle: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.45,
          color: AppColors.textSecondary,
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.cardSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        modalElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: AppRadius.r24),
        ),
        showDragHandle: true,
        dragHandleColor: AppColors.borderSubtle,
        dragHandleSize: const Size(36, 4),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.cardSurface;
        }),
        checkColor: WidgetStateProperty.all(AppColors.textOnPrimary),
        side: const BorderSide(
          color: AppColors.border,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.cardSurface;
          }
          return AppColors.textMuted;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.containerLow;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.textMuted;
        }),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.containerLow,
        selectedColor: AppColors.primaryLight,
        disabledColor: AppColors.containerLow,
        labelStyle: GoogleFonts.sora(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        secondaryLabelStyle: GoogleFonts.sora(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: const StadiumBorder(),
        side: BorderSide.none,
        elevation: 0,
        pressElevation: 0,
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.lg,
        ),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.primaryLight,
        circularTrackColor: AppColors.primaryLight,
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarThemeData(
        indicatorColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textMuted,
        labelStyle: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        dividerColor: AppColors.border,
      ),

      // Popup Menu Theme
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.cardSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 4,
        shadowColor: const Color(0x140F172A),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.md,
          side: const BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderWidthDefault,
          ),
        ),
        textStyle: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
      ),

      // SnackBar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textPrimary,
        contentTextStyle: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textOnPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.md,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

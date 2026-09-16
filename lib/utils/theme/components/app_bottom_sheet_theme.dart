import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_dimensions.dart';

/// Centralized Material 3 Bottom Sheet Theme for Sellora POS.
class AppBottomSheetTheme {
  AppBottomSheetTheme._();

  static BottomSheetThemeData get bottomSheetTheme =>
      const BottomSheetThemeData(
        backgroundColor: AppColors.cardSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        modalElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimensions.radiusXL),
          ),
        ),
        showDragHandle: true,
        dragHandleColor: AppColors.borderSubtle,
        dragHandleSize: Size(36, 4),
      );
}

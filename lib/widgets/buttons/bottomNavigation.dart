import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:sellora/utils/theme/app_colors.dart';
import 'package:sellora/utils/theme/app_dimensions.dart';
import 'package:sellora/utils/theme/app_typography.dart';

Widget customBottomNavigation(BuildContext context, String title) {
  return Container(
    padding: EdgeInsets.only(
      left: 20,
      right: 20,
      top: 12,
      bottom: MediaQuery.of(context).padding.bottom > 0
          ? MediaQuery.of(context).padding.bottom + 8
          : 16,
    ),
    decoration: BoxDecoration(
      color: AppColors.cardSurface,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, -4),
        ),
      ],
      border: const Border(top: BorderSide(color: AppColors.border, width: 1)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildSaveButton(context, title),
        const SizedBox(height: 6),
        buildSaveAndAddAnotherButton(context),
      ],
    ),
  );
}

Widget buildSaveButton(BuildContext context, String title) {
  return SizedBox(
    width: double.infinity,
    height: AppDimensions.primaryButtonHeight,
    child: ElevatedButton(
      onPressed: () {
        Get.snackbar(
          "Success",
          "Product saved successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primary,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          borderRadius: AppDimensions.radiusLG,
          duration: const Duration(seconds: 2),
        );
      },

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
           title,
            style: AppTypography.button.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

/// Save & Add Another Button
Widget buildSaveAndAddAnotherButton(BuildContext context, ) {
  return GestureDetector(
    onTap: () {
      Get.snackbar(
        "Ready",
        "Form cleared for next product.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.textPrimary,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: AppDimensions.radiusLG,
        duration: const Duration(seconds: 2),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        "Save & Add Another",
        style: AppTypography.bodyMedium.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

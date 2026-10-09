import 'package:flutter/material.dart';
import 'package:sellora/utils/theme/app_colors.dart';
import 'package:sellora/utils/theme/app_dimensions.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/utils/theme/app_typography.dart';

class CustomSearchbar extends StatelessWidget {
  String hinttext;
  TextEditingController controller;
  CustomSearchbar({
    super.key,
    required this.hinttext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            border: Border.all(
              color: AppColors.border,
              width: AppDimensions.borderWidth,
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.search_rounded,
                color: AppColors.textMuted,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: hinttext,
                    hintStyle: AppTypography.bodySmall.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 12.5,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),

              // Obx(() {
              //   if (controller.searchQuery.value.isNotEmpty) {
              //     return GestureDetector(
              //       onTap: controller.clearSearch,
              //       child: const Icon(
              //         Icons.cancel_outlined,
              //         color: AppColors.textMuted,
              //         size: 18,
              //       ),
              //     );
              //   }
              //   return const SizedBox.shrink();
              // }),
            ],
          ),
        ),
        const SizedBox(height: AppTheme.spacingMD),
      ],
    );
  }
}

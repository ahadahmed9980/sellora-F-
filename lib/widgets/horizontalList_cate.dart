import 'package:flutter/material.dart';
import 'package:sellora/utils/theme/app_colors.dart';
import 'package:sellora/utils/theme/app_dimensions.dart';
import 'package:sellora/utils/theme/app_typography.dart';

class BuildHorizontalList extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int count;
  const BuildHorizontalList({
    super.key,
    required this.title,
    required this.isSelected,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 44.0,
          alignment: Alignment.center,

          //padding
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.cardSurface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.border,
              width: AppDimensions.borderWidth,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Text(
                title,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                ),
              ),
              SizedBox(width: 2),
              Text(
                "(${count.toString()})",
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sellora/models/setupCategoryModel.dart';
import 'package:sellora/utils/theme/app_theme.dart';

/// Reusable Category Selector with pill-shaped chips and instant touch feedback.
class DynamicCategorySelector extends StatelessWidget {
  final List<CategoryItem> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;
  final double height;
  final ScrollPhysics physics;

  const DynamicCategorySelector({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
    this.height = 44.0,
    this.physics = const BouncingScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: physics,
        child: Row(
          children: categories.asMap().entries.map((entry) {
            final index = entry.key;
            final category = entry.value;
            final isSelected = selectedIndex == index;

            return Padding(
              padding: EdgeInsets.only(
                right: index == categories.length - 1 ? 0 : AppTheme.spacingSM,
              ),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (_) => onCategorySelected(index),
                onTap: () => onCategorySelected(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? AppColors.primary : AppColors.cardSurface,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusPill,
                    ),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        category.icon,
                        size: 18,
                        color:
                            isSelected ? Colors.white : AppColors.textSecondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        category.title,
                        style: AppTypography.bodyMedium.copyWith(
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w500,
                          color:
                              isSelected ? Colors.white : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

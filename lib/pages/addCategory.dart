import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellora/controller/addCategory.controller.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/appbar.dart';
import 'package:sellora/widgets/buttons/bottomNavigation.dart';

class Addcategory extends StatelessWidget {
  Addcategory({super.key});

  final Addcategorycontroller controller = Get.find<Addcategorycontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: buildAppBar(context, 'New Category', "Catalog Management"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: AppTheme.screenPadding,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: AppTheme.spacingSM),

              // Main Category Form Card
              _buildMainCategoryCard(context),

              const SizedBox(height: AppTheme.spacingLG),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigation(context, 'Save Category'),
    );
  }

  /// Main Card containing all 4 category configuration sections
  Widget _buildMainCategoryCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderWidth,
        ),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Category Name Section
          _buildCategoryNameSection(),
          const SizedBox(height: AppTheme.spacingLG),

          // 2. Select Category Icon Section
          _buildCategoryIconSection(),
          const SizedBox(height: AppTheme.spacingLG),

          // 3. Category Color Tag Section
          _buildCategoryColorSection(),
          const SizedBox(height: AppTheme.spacingLG),

          // 4. Description (Optional) Section
          _buildDescriptionSection(),
        ],
      ),
    );
  }

  /// 1. Category Name Input Section
  Widget _buildCategoryNameSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row: Category Name * (Required)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: "Category Name ",
                style: AppTypography.h3.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
                children: const [
                  TextSpan(
                    text: "*",
                    style: TextStyle(
                      color: AppColors.error,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Required",
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingSM),

        // Text Field Container
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            border: Border.all(
              color: const Color(0xFFE2E8F0),
              width: AppDimensions.borderWidth,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.nameController,
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter category name",
                    hintStyle: AppTypography.bodyLarge.copyWith(
                      color: AppColors.textMuted,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Obx(() {
                if (controller.hasCategoryName.value) {
                  return GestureDetector(
                    onTap: controller.clearName,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE2E8F0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        color: AppColors.textSecondary,
                        size: 16,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
            ],
          ),
        ),
      ],
    );
  }

  /// 2. Category Icon Grid (12 Icons, 3x4 Grid)
  Widget _buildCategoryIconSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row: Title & Touch to choose hint
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Select Category Icon",
              style: AppTypography.h3.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              "Touch to choose",
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),

        // Subtitle explanation
        Text(
          "Choose an icon for rapid visual cashier scanning on checkout grid.",
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
            height: 1.35,
          ),
        ),
        const SizedBox(height: AppTheme.spacingMD),

        // 3 Rows x 4 Columns Icon Grid
        Obx(() {
          final selectedIdx = controller.selectedIconIndex.value;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.categoryIcons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              final item = controller.categoryIcons[index];
              final isSelected = selectedIdx == index;

              return GestureDetector(
                onTap: () => controller.selectIcon(index),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFF5F3FF)
                            : AppColors.cardSurface,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusLG,
                        ),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.border,
                          width: isSelected ? 2.0 : AppDimensions.borderWidth,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          item.icon,
                          size: 26,
                          color: isSelected
                              ? AppColors.primary
                              : const Color(0xFF334155),
                        ),
                      ),
                    ),
                    if (isSelected)
                      Positioned(
                        top: 6,
                        right: 6,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 11,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        }),
      ],
    );
  }

  /// 3. Category Color Swatches (8 Swatches, 2x4 Grid)
  Widget _buildCategoryColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row: Title & Active Color Name
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category Color Tag",
              style: AppTypography.h3.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Obx(
              () => Text(
                controller.selectedColorName,
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w700,
                  color: controller.selectedColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),

        // Subtitle explanation
        Text(
          "Helps cashiers recognize department groups faster under pressure.",
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
            height: 1.35,
          ),
        ),
        const SizedBox(height: AppTheme.spacingMD),

        // 2 Rows x 4 Columns Color Swatches
        Obx(() {
          final selectedIdx = controller.selectedColorIndex.value;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.colorSwatches.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.45,
            ),
            itemBuilder: (context, index) {
              final swatch = controller.colorSwatches[index];
              final isSelected = selectedIdx == index;

              return GestureDetector(
                onTap: () => controller.selectColor(index),
                child: Container(
                  padding: isSelected
                      ? const EdgeInsets.all(2.5)
                      : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                    border: isSelected
                        ? Border.all(
                            color: swatch.color.withValues(alpha: 0.35),
                            width: 2.5,
                          )
                        : null,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: swatch.color,
                      borderRadius: BorderRadius.circular(
                        isSelected
                            ? AppDimensions.radiusMD
                            : AppDimensions.radiusLG,
                      ),
                    ),
                    child: isSelected
                        ? const Center(
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }

  /// 4. Category Description Section (Optional)
  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row: Description & Character counter (e.g. 35 / 200)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Description (Optional)",
              style: AppTypography.h3.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Obx(
              () => Text(
                "${controller.descriptionLength.value} / 200",
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingSM),

        // Multiline Text Area
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            border: Border.all(
              color: const Color(0xFFE2E8F0),
              width: AppDimensions.borderWidth,
            ),
          ),
          child: TextField(
            controller: controller.descriptionController,
            maxLength: 200,
            maxLines: 4,
            minLines: 3,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              height: 1.4,
            ),
            decoration: InputDecoration(
              hintText: "Cold drinks, packaged juices, sodas",
              hintStyle: AppTypography.bodyMedium.copyWith(
                color: AppColors.textMuted,
              ),
              border: InputBorder.none,
              isDense: true,
              counterText: "",
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}

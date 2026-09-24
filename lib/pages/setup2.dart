import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sellora/controller/setup2.controller.dart';
import 'package:sellora/models/setupCategoryModel.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/buttons/button.dart';
import 'package:sellora/widgets/category_selector.dart';
import 'package:sellora/widgets/formfield.dart';

class Setup2 extends StatelessWidget {
  Setup2({super.key});
  final Setup2controller controller = Get.find<Setup2controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.splashScreenGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: AppTheme.screenPadding,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                buildTopBar(context),
                const SizedBox(height: AppTheme.spacingMD),
                topLines(),
                const SizedBox(height: AppTheme.spacingLG),
                Image.asset(
                  "assets/images/setup2.png",
                  height: 140,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: AppTheme.spacingSM),
                Text(
                  "Set up your shop",
                  style: AppTypography.displayMedium.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.spacingSM),
                Text(
                  "Tell us a bit about your store to customize\nyour POS experience",
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.spacingXL),
                buildMainCard(controller, context),
                const SizedBox(height: AppTheme.spacingXL),
                buildTrustBadge(),
                const SizedBox(height: AppTheme.spacingMD),
                buildFooter(),
                const SizedBox(height: AppTheme.spacingLG),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Top bar with Back Button, Sellora Brand Pill, and Step Badge
  Widget buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Circular Back Button
        GestureDetector(
          onTap: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              context.push('/setup1');
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.cardSurface,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.border,
                width: AppTheme.borderWidth,
              ),
              boxShadow: AppTheme.cardShadow,
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 20,
              color: AppColors.textPrimary,
            ),
          ),
        ),

        // Brand Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.cardSurface,
            borderRadius: BorderRadius.circular(AppTheme.radiusPill),
            border: Border.all(
              color: AppColors.border,
              width: AppTheme.borderWidth,
            ),
            boxShadow: AppTheme.cardShadow,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/logo.png", height: 22, width: 22),
              const SizedBox(width: AppTheme.spacingSM),
              Text(
                "Sellora",
                style: AppTypography.h3.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),

        // Step 2 of 2 Badge with Check icon
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: BorderRadius.circular(AppTheme.radiusPill),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                size: 16,
                color: AppColors.primary,
              ),
              const SizedBox(width: 4),
              Text(
                "Step 2 of 2",
                style: AppTypography.badge.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 2-step Progress Bar (both filled for step 2)
  Widget topLines() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppTheme.radiusLG),
            ),
          ),
        ),
        const SizedBox(width: AppTheme.spacingSM),
        Expanded(
          child: Container(
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppTheme.radiusLG),
            ),
          ),
        ),
      ],
    );
  }

  /// Main White Card with Shop Setup Fields
  Widget buildMainCard(Setup2controller controller, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppTheme.heroCardPadding,
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(AppTheme.radiusXL),
        border: Border.all(
          color: AppColors.border,
          width: AppTheme.borderWidth,
        ),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Shop Name Field
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shop Name",
                style: AppTypography.h3.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                "Required",
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingSM),
          DynamicTextFormField(
            controller: controller.shopNameController,
            prefixIcon: Icons.storefront_outlined,
            hintText: "Luna Boutique",
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // 2. Shop Category Section (using reusable DynamicCategorySelector)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shop Category",
                style: AppTypography.h3.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                "Select primary",
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingSM),
          Obx(
            () => DynamicCategorySelector(
              categories: controller.setupcategories,
              selectedIndex: controller.selectedIndex.value,
              onCategorySelected: controller.updateIndex,
            ),
          ),
          const SizedBox(height: AppTheme.spacingLG),

          // 3. Store Currency Section
          Text(
            "Store Currency",
            style: AppTypography.h3.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
          buildCurrencySelector(controller),
          const SizedBox(height: AppTheme.spacingSM),
          Text(
            "You can add secondary currencies anytime in store settings.",
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textMuted,
              fontSize: 12,
              height: 1.35,
            ),
          ),
          const SizedBox(height: AppTheme.spacingLG),

          // 4. Store Address Field
          Text(
            "Store Address",
            style: AppTypography.h3.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
          DynamicTextFormField(
            controller: controller.storeAddressController,
            prefixIcon: Icons.location_on_outlined,
            hintText: "Shop 4B, Phase 5 DHA, Lahore",
          ),
          const SizedBox(height: AppTheme.spacingXL),

          // 5. Finish Setup Button
          customButton(context, "Finish Setup", () {
            context.push('/homePage');
          }),
        ],
      ),
    );
  }

  /// Store Currency Selector Card with Popup Menu
  Widget buildCurrencySelector(Setup2controller controller) {
    return Obx(() {
      final currency = controller.selectedCurrency.value;

      return PopupMenuButton<CurrencyItem>(
        tooltip: "Select Store Currency",
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        ),
        onSelected: (item) {
          controller.updateCurrency(item);
        },
        itemBuilder: (context) => controller.currencies.map((item) {
          final isItemCurrent = item.code == currency.code;
          return PopupMenuItem<CurrencyItem>(
            value: item,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.code,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      item.name,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                if (isItemCurrent)
                  const Icon(
                    Icons.check_rounded,
                    size: 18,
                    color: AppColors.primary,
                  ),
              ],
            ),
          );
        }).toList(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.cardSurface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
            border: Border.all(
              color: AppColors.border,
              width: AppDimensions.borderWidth,
            ),
          ),
          child: Row(
            children: [
              // Currency Icon Tile
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                ),
                child: const Icon(
                  Icons.payments_outlined,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: AppTheme.spacingMD),

              // Currency Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      currency.code,
                      style: AppTypography.h3.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      currency.name,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Default Badge Pill + Dropdown Arrow
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.containerLow,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Default",
                      style: AppTypography.bodySmall.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  /// Cloud Sync & Encrypted Data Trust Badge
  Widget buildTrustBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderWidth,
        ),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.cloud_outlined,
            size: 16,
            color: AppColors.success,
          ),
          const SizedBox(width: 6),
          Text(
            "Cloud Sync Ready",
            style: AppTypography.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontSize: 12,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "•",
              style: TextStyle(color: AppColors.textMuted),
            ),
          ),
          const Icon(
            Icons.lock_outline_rounded,
            size: 16,
            color: AppColors.primary,
          ),
          const SizedBox(width: 6),
          Text(
            "Encrypted Data",
            style: AppTypography.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  /// Footer Copyright Notice
  Widget buildFooter() {
    return Text(
      "Sellora Cloud POS © 2025 • High Velocity Retail Systems",
      style: AppTypography.bodySmall.copyWith(
        fontSize: 11,
        color: AppColors.textMuted,
      ),
      textAlign: TextAlign.center,
    );
  }
}

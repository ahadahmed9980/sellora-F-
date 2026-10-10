import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:sellora/controller/product_list.controller.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/appbar.dart';
import 'package:sellora/widgets/buildMetricCard.dart';
import 'package:sellora/widgets/searchBar.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});
  final Productlistcontroller controller =
      Get.isRegistered<Productlistcontroller>()
      ? Get.find<Productlistcontroller>()
      : Get.put(Productlistcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: buildAppBar(context, 'Products', "Manage Products"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: AppTheme.screenPadding,
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: AppTheme.spacingSM),

              //custom search bar
              CustomSearchbar(
                hinttext: "Search products or SKU...",
                controller: controller.searchController,
              ),
              const SizedBox(height: AppTheme.spacingLG),
              Obx(() {
                final selectedIdx = controller.selectedIndex.value;
                return SizedBox(
                  height:
                      44, // chip ki height (ya thoda zyada, shadow ke liye 50)
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final isSelected = selectedIdx == index;
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          controller.selectedIndex.value = index;
                        },
                        child: buildHorizontalList(
                          title: controller.setupCategories[index].title,
                          count: controller.setupCategories[index].count,
                          isSelected: isSelected,
                          // optional
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemCount: controller.setupCategories.length,
                  ),
                );
              }),

              const SizedBox(height: AppTheme.spacingLG),

              // 2. Three Mini Metric Cards
              buildMetricCardsRow(),
              const SizedBox(height: AppTheme.spacingLG),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Active Product Feed",style: AppTheme.bodyLarge,),
                  Text(
                    "Sorted by Stock",
                    style: TextStyle(color: AppColors.primary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildMetricCardsRow() {
  return Row(
    children: [
      // 1. Cash Collected
      Expanded(
        child: buildMetricCard(
          title: "TOTAL VALUE",
          amount: "Rs 32,800",
          icon: Icons.payments_rounded,
          iconBgColor: AppColors.cardGreenIconBg,
          iconColor: AppColors.cardGreenIcon,
          cardBgColor: AppColors.cardGreenBg,
          borderColor: AppColors.cardGreenBorder,
          dotColor: const Color(0xFF10B981),
        ),
      ),

      const SizedBox(width: 10),

      // 3. Expenses
      Expanded(
        child: buildMetricCard(
          title: "LOW STOCK",
          amount: "3 Items",
          icon: Icons.warning_amber_rounded,
          iconBgColor: AppColors.cardOrangeBg,
          iconColor: AppColors.cardOrangeIcon,
          cardBgColor: AppColors.cardOrangeBg,
          borderColor: AppColors.cardOrangeBorder,
          dotColor: Colors.orange,
        ),
      ),
      const SizedBox(width: 10),

      // 2. Credit (Udhaar)
      Expanded(
        child: buildMetricCard(
          title: "OUT OF STOCK",
          amount: "0 Items",
          icon: Icons.remove_shopping_cart_rounded,
          iconBgColor: AppColors.cardRedIconBg,
          iconColor: AppColors.cardRedIcon,
          cardBgColor: AppColors.cardRedBg,
          borderColor: AppColors.cardRedBorder,
          dotColor: const Color(0xFFEF4444),
        ),
      ),
    ],
  );
}

class buildHorizontalList extends StatelessWidget {
  String title;
  bool isSelected;
  int count;
  buildHorizontalList({
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

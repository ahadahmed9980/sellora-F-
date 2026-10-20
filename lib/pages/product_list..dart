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
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Active Product Feed", style: AppTheme.bodyLarge),
                  Spacer(),
                  Text(
                    "Sorted by Stock",
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              // product container
              const SizedBox(height: AppTheme.spacingLG),
              // product list builder. seperated
              Obx(() {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  scrollDirection: Axis.vertical,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemCount: controller.productsList.length,
                  itemBuilder: (context, index) {
                    final productDetail = controller.productsList[index];
                    return buildProductListContainer(
                      productDetail.category,
                      productDetail.sku,
                      productDetail.title,
                      productDetail.price,
                      productDetail.icon,
                      productDetail.stockText,
                      productDetail.profitText,
                      productDetail.isLowStock,
                    );
                  },
                );
              }),
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

Widget buildProductListContainer(
  String category,
  String sku,
  String title,
  String price,
  IconData icon,
  String stock,
  String profit,

  bool isLowStock,
) {
  final Color iconColor = switch (category.toLowerCase()) {
    'beverages' => AppColors.cardRedIcon, // Red background
    'snacks' => AppColors.cardOrangeIcon, // Orange/Yellow background
    'groceries' || 'grocery' => AppColors.cardGreenIcon, // Purple background
    _ => Colors.grey.shade100, // Default color
  };
  final Color iconContainerColor = switch (category.toLowerCase()) {
    'beverages' => AppColors.cardRedBg, // Red background
    'snacks' => AppColors.cardOrangeBg, // Orange/Yellow background
    'groceries' || 'grocery' => AppColors.cardGreenBg, // Purple background
    _ => Colors.grey.shade100, // Default color
  };
  final Color iconContainerBorderColor = switch (category.toLowerCase()) {
    'beverages' => AppColors.cardRedBorder, // Red background
    'snacks' => AppColors.cardOrangeBorder, // Orange/Yellow background
    'groceries' || 'grocery' => AppColors.cardGreenBorder, // Purple background
    _ => Colors.grey.shade100, // Default color
  };
  final Color lowStockbackground = switch (isLowStock) {
    true => AppColors.cardOrangeBg,
    false => AppColors.cardGreenBg,
  };
  final Color textcolor = switch (isLowStock) {
    true => Colors.deepOrange,
    false => Colors.green,
  };
  final Color dotcolor = switch (isLowStock) {
    true => Colors.orange,
    false => Colors.green,
  };
  final Color bordercolor = switch (isLowStock) {
    true => AppColors.cardOrangeBorder,
    false => AppColors.cardGreenBg,
  };

  return Container(
    width: double.infinity,
    padding: AppTheme.cardPadding,
    decoration: BoxDecoration(
      color: AppColors.cardSurface,
      borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
      border: Border.all(
        color: AppColors.border,
        width: AppDimensions.borderWidth,
      ),
      boxShadow: AppTheme.cardShadow,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: AspectRatio(
            aspectRatio: 1.0, // Responsive circle ratio barkarar rakhta hai
            child: Container(
              padding: const EdgeInsets.all(
                12,
              ), // Padding se circle responsive bara rehta hai
              decoration: BoxDecoration(
                color: iconContainerColor,
                shape: BoxShape.circle,
                border: Border.all(color: iconContainerBorderColor, width: 1.0),
              ),
              child: FittedBox(
                // FittedBox icon ko container ke mutabiq scale karta hai
                fit: BoxFit.contain,
                child: Icon(icon, color: iconColor),
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //title
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.h2.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "RS ${price}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTheme.h2.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),

              // category and sku
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(width: 13),
                  Text(
                    sku,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.bodySmall.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              // stock left container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                // height: 20,
                // width: 50,
                decoration: BoxDecoration(
                  color: lowStockbackground,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                  border: Border.all(color: bordercolor, width: 1.0),
                ),
                //dot and text
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: dotcolor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      stock,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.bodyMedium.copyWith(
                        color: textcolor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 4),
                    isLowStock
                        ? Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              shape: BoxShape.circle,
                            ),
                          )
                        : SizedBox.shrink(),

                    SizedBox(width: 4),
                    Text(
                      isLowStock ? "Low Stock" : '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.bodyMedium.copyWith(
                        color: textcolor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),

                decoration: BoxDecoration(
                  color: AppColors.cardGreenBg,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                  border: Border.all(
                    color: AppColors.cardGreenBorder,
                    width: 1.0,
                  ),
                ),
                //dot and text
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      profit,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.bodyMedium.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

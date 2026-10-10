import 'package:flutter/material.dart';
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

              // 2. Three Mini Metric Cards
              buildMetricCardsRow(),
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

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sellora/controller/newSale.controller.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/appbar.dart';
import 'package:sellora/widgets/horizontalList_cate.dart';
import 'package:sellora/widgets/searchBar.dart';

class Newsale extends StatelessWidget {
  Newsale({super.key});
  final Newsalecontroller controller = Get.isRegistered<Newsalecontroller>()
      ? Get.find<Newsalecontroller>()
      : Get.put(Newsalecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: buildAppBar(context, 'New Sale', "Create new sale"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: AppTheme.screenPadding,
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
                        child: BuildHorizontalList(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Products", style: AppTheme.bodyLarge),
                  Spacer(),
                  Text(
                    "Sorted by name",
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacingLG),
              Container(
                // height: 200,
                width: 250,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //stack
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: AppColors.grey,
                          width: double.infinity,
                          child: Image.network(
                            "https://t4.ftcdn.net/jpg/17/56/46/65/360_F_1756466505_lKBSuhez5K9F0Z5i2luH59Vi9hufRfJF.jpg",
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.broken_image,
                                color: AppColors.primary,
                                size: 40,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 00,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            // height: 30,
                            padding: EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              top: 5,
                              bottom: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.cardGreenIcon,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusXL,
                              ),
                            ),
                            //stock
                            child: Text(
                              "24 in stock",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.bodySmall.copyWith(
                                fontWeight: FontWeight.w900,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    Text(
                      // category.toUpperCase(),
                      "Beverages",
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingXS),
                    Text(
                      'Lays Classic Salted 65g',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.h2.copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: AppTheme.spacingXS),
                    Text(
                      "RS 110",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTheme.h1.copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: AppTheme.spacingXXXL),
                    //button
                    Container(
                      height: 40,
                      width: double.infinity,
                      padding: AppTheme.screenPadding,
                      decoration: BoxDecoration(
                        color: AppColors.ambientOrb,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusXL,
                        ),
                        border: Border.all(
                          color: AppColors.border,
                          width: AppDimensions.borderWidth,
                        ),
                        boxShadow: AppTheme.cardShadow,
                      ),
                      child: controller.quantity == 0 ?
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_outlined, color: AppColors.primary),
                          SizedBox(width: 5),
                          Text(
                            "Add",
                            style: AppTheme.bodyLarge.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      );
                        },
                      ) 
                    ):
                    // now quantity will appear if someone click on add button 
                 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

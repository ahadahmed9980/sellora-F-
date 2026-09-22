import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellora/controller/addProduct.controller.dart';
import 'package:sellora/utils/scanner_screen.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/appbar.dart';
import 'package:sellora/widgets/category_selector.dart';
import 'package:sellora/widgets/formfield.dart';

class Addproduct extends StatelessWidget {
  Addproduct({super.key});
  final Addproductcontroller controller = Get.find<Addproductcontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: buildAppBar(
        context,
        'Add Product',
        "Catalog & Inventory Management",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: AppTheme.screenPadding,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: AppTheme.spacingSM),

              // 1. Hero Photo Upload Card
              buildPhotoUploadCard(context),
              const SizedBox(height: AppTheme.spacingLG),

              // 2. Basic Details Card
              buildBasicDetailsCard(context),
              const SizedBox(height: AppTheme.spacingLG),

              // 3. Pricing & Margins Card
              buildPricingCard(),
              const SizedBox(height: AppTheme.spacingLG),

              // 4. Inventory & Stock Card
              buildInventoryCard(),
              const SizedBox(height: AppTheme.spacingLG),

              // 5. Active in POS Register Toggle Card
              buildPosActiveCard(),
              const SizedBox(height: AppTheme.spacingLG),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
          border: const Border(
            top: BorderSide(color: AppColors.border, width: 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildSaveButton(context),
            const SizedBox(height: 6),
            buildSaveAndAddAnotherButton(context),
          ],
        ),
      ),
    );
  }

  /// 1. Hero Product Photo Upload Card with Camera & Gallery actions
  Widget buildPhotoUploadCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderWidth,
        ),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Obx(() {
        final image = controller.selectedImage.value;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
            border: Border.all(color: AppColors.primaryContainer, width: 1.5),
          ),
          child: image == null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Camera icon circle
                    Container(
                      width: 58,
                      height: 58,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        color: AppColors.primary,
                        size: 26,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingMD),

                    // Title
                    Text(
                      "Tap to upload product photo",
                      style: AppTypography.h3.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),

                    // Subtitle
                    Text(
                      "Supports JPG, PNG up to 5MB",
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textMuted,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppTheme.spacingLG),

                    // Camera and Gallery buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Camera Button
                        GestureDetector(
                          onTap: () => controller.pickImage(ImageSource.camera),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.cardSurface,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusPill,
                              ),
                              border: Border.all(
                                color: AppColors.border,
                                width: AppDimensions.borderWidth,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x08000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 16,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "Camera",
                                  style: AppTypography.bodySmall.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: AppTheme.spacingMD),

                        // Gallery Button
                        GestureDetector(
                          onTap: () =>
                              controller.pickImage(ImageSource.gallery),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.cardSurface,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusPill,
                              ),
                              border: Border.all(
                                color: AppColors.border,
                                width: AppDimensions.borderWidth,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x08000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.photo_library_outlined,
                                  size: 16,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "Gallery",
                                  style: AppTypography.bodySmall.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMD,
                      ),
                      child: Image.file(
                        image,
                        width: double.infinity,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: controller.removeImage,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () => controller.pickImage(ImageSource.gallery),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusPill,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.refresh,
                                size: 14,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "Change",
                                style: AppTypography.bodySmall.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }

  /// 2. Basic Details Card
  Widget buildBasicDetailsCard(BuildContext context) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.tune_rounded,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Basic Details",
                    style: AppTypography.h3.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Text(
                "Required Fields",
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingLG),

          // Product Name *
          Text(
            "Product Name *",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
          DynamicTextFormField(
            controller: controller.productNameController,
            hintText: "Coca Cola 1.5L",
            suffixIcon: Icons.cancel_outlined,
            onSuffixTap: () => controller.productNameController.clear(),
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Category * (using reusable DynamicCategorySelector)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category *",
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              GestureDetector(
                onTap: () => showAddCategoryDialog(context),
                child: Text(
                  "+ New",
                  style: AppTypography.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingSM),
          Obx(
            () => DynamicCategorySelector(
              categories: controller.categories,
              selectedIndex: controller.selectedCategoryIndex.value,
              onCategorySelected: controller.updateCategory,
            ),
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // SKU / Item Code
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SKU / Item Code",
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              GestureDetector(
                onTap: controller.generateSKU,
                child: Row(
                  children: [
                    const Icon(Icons.sync, size: 14, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Text(
                      "Auto-generate",
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingSM),
          DynamicTextFormField(
            controller: controller.skuController,
            hintText: "SKU-BEV-001",
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Barcode (UPC / EAN)
          Text(
            "Barcode (UPC / EAN)",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
          // DynamicTextFormField(
          //   controller: controller.barcodeController,
          //   hintText: "8901234567890",
          //   prefixIcon: Icons.view_week_outlined,
          //   suffixWidget: Padding(
          //     padding: const EdgeInsets.only(right: 0),
          //     child: GestureDetector(
          //       onTap: () {

          //       },
          //       child: Container(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 10,
          //           vertical: 6,
          //         ),
          //         decoration: BoxDecoration(
          //           color: AppColors.primaryContainer,
          //           borderRadius: BorderRadius.circular(
          //             AppDimensions.radiusPill,
          //           ),
          //         ),
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             const Icon(
          //               Icons.qr_code_scanner_rounded,
          //               size: 16,
          //               color: AppColors.primary,
          //             ),
          //             const SizedBox(width: 4),
          //             Text(
          //               "Scan",
          //               style: AppTypography.bodySmall.copyWith(
          //                 fontWeight: FontWeight.w700,
          //                 color: AppColors.primary,
          //                 fontSize: 12,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          DynamicTextFormField(
            controller: controller.barcodeController,
            hintText: "8901234567890",
            prefixIcon: Icons.view_week_outlined,
            suffixWidget: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: GestureDetector(
                onTap: () async {
                  // 1. Scanner open karein
                  final String? scannedCode = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScannerScreen(),
                    ),
                  );

                  // 2. Result aate hi controller ke method ke zariye update karein
                  if (scannedCode != null && scannedCode.isNotEmpty) {
                    controller.updateBarcode(scannedCode);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusPill,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Scan",
                        style: AppTypography.bodySmall.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 3. Pricing & Margins Card
  Widget buildPricingCard() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.payments_outlined,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Pricing & Margins",
                    style: AppTypography.h3.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.containerLow,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                ),
                child: Text(
                  "Tax inclusive",
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingLG),

          // Two Columns: Cost Price & Selling Price
          Row(
            children: [
              // Cost Price (Buying)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cost Price (Buying)",
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingSM),
                    DynamicTextFormField(
                      controller: controller.costPriceController,
                      hintText: "180",
                      keyboardType: TextInputType.number,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Text(
                          "Rs",
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textMuted,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppTheme.spacingMD),

              // Selling Price (Retail)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selling Price (Retail)",
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingSM),
                    DynamicTextFormField(
                      controller: controller.sellingPriceController,
                      hintText: "220",
                      keyboardType: TextInputType.number,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Text(
                          "Rs",
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Dynamic Margin Indicator Card
          Obx(() {
            final margin = controller.marginPercent.value;
            final profit = controller.profitAmount.value;
            final markup = controller.markupPercent.value;
            final health = controller.marginHealth.value;

            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F8F2),
                borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                border: Border.all(color: const Color(0xFFB7EAD6), width: 1),
              ),
              child: Row(
                children: [
                  // Green Circle Icon
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Color(0xFFDCFCE7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.trending_up_rounded,
                      color: Color(0xFF10B981),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Margin & Markup Breakdown
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Margin ",
                              style: AppTypography.bodyMedium.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              "· Profit Rs ${profit >= 0 ? profit.toStringAsFixed(0) : 0}/unit",
                              style: AppTypography.bodySmall.copyWith(
                                color: const Color(0xFF0F9F6E),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              "${margin.toStringAsFixed(2)}%",
                              style: AppTypography.h3.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Markup: +${markup.toStringAsFixed(1)}%",
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.success,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Health Badge Pill
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: health == "HEALTHY"
                          ? AppColors.success
                          : (health == "MODERATE"
                                ? AppColors.warning
                                : AppColors.error),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusPill,
                      ),
                    ),
                    child: Text(
                      health,
                      style: AppTypography.badge.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  /// 4. Inventory & Stock Card
  Widget buildInventoryCard() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.inventory_2_outlined,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Inventory & Stock",
                    style: AppTypography.h3.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.circle, size: 8, color: AppColors.success),
                  const SizedBox(width: 4),
                  Text(
                    "In Stock",
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingLG),

          // Two Columns: Current Stock & Low Stock Alert
          Row(
            children: [
              // Cost Price (Buying)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Stock",
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingSM),
                    DynamicTextFormField(
                      controller: controller.currentStockController,
                      hintText: "50",
                      keyboardType: TextInputType.number,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppTheme.spacingMD),

              // Selling Price (Retail)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Low Stock Alert At",
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingSM),
                    DynamicTextFormField(
                      controller: controller.lowStockAlertController,
                      hintText: "10",
                      keyboardType: TextInputType.number,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Unit of Measurement
          Text(
            "Unit of Measurement",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
          Obx(() {
            return PopupMenuButton<String>(
              tooltip: "Select Unit",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
              ),
              onSelected: controller.updateUnit,
              itemBuilder: (context) => controller.units.map((unit) {
                final isSelected = controller.selectedUnit.value == unit;
                return PopupMenuItem<String>(
                  value: unit,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        unit,
                        style: AppTypography.bodyMedium.copyWith(
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textPrimary,
                        ),
                      ),
                      if (isSelected)
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
                height: AppDimensions.inputHeight,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.cardSurface,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
                  border: Border.all(
                    color: AppColors.border,
                    width: AppDimensions.borderWidth,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.selectedUnit.value,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: AppTheme.spacingMD),

          // Description (Optional)
          Text(
            "Description (Optional)",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
          DynamicTextFormField(
            controller: controller.descriptionController,
            hintText:
                "Flavor notes, packaging specifications, vendor details...",
            maxLength: 300,
          ),
        ],
      ),
    );
  }

  /// 5. Active in POS Register Card
  Widget buildPosActiveCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
        children: [
          // Text Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Active in POS Register",
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusPill,
                        ),
                      ),
                      child: Text(
                        "Instant Sale",
                        style: AppTypography.badge.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Allow cashier terminals to scan and bill this product immediately.",
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppTheme.spacingMD),

          // Switch
          Obx(
            () => Switch.adaptive(
              value: controller.isActiveInPOS.value,
              activeThumbColor: AppColors.primary,
              activeTrackColor: AppColors.primary.withValues(alpha: 0.4),
              onChanged: controller.toggleActiveInPOS,
            ),
          ),
        ],
      ),
    );
  }

  /// 6. Save Product CTA Button
  Widget buildSaveButton(BuildContext context) {
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
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: AppColors.primary,
        //   elevation: 0,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
        //   ),
        // ),
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
              "Save Product",
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
  Widget buildSaveAndAddAnotherButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.productNameController.clear();
        controller.descriptionController.clear();
        controller.selectedImage.value = null;
        controller.generateSKU();
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

  /// Add Category Dialog
  void showAddCategoryDialog(BuildContext context) {
    final TextEditingController newCategoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        ),
        title: Text(
          "Add Category",
          style: AppTypography.h3.copyWith(fontWeight: FontWeight.w700),
        ),
        content: TextField(
          controller: newCategoryController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Category name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (newCategoryController.text.trim().isNotEmpty) {
                controller.addCategory(
                  newCategoryController.text.trim(),
                  Icons.category_outlined,
                );
                Navigator.pop(ctx);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}

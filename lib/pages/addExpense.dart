import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellora/controller/addExpense.controller.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/appbar.dart';
import 'package:sellora/widgets/buttons/bottomNavigation.dart';

class Addexpense extends StatelessWidget {
  Addexpense({super.key});
  final Addexpensecontroller controller = Get.find<Addexpensecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: buildAppBar(context, 'Add Expense', "Manage Business Outflow"),
      body: SafeArea(
        child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
          padding: AppTheme.screenPadding,
          child: Column(
            children: [
              const SizedBox(height: AppTheme.spacingSM),

              // 1. Expense Amount Card
              _buildExpenseAmountCard(),
              const SizedBox(height: AppTheme.spacingLG),

              // 2. Expense Category Card
              _buildExpenseCategoryCard(),
              const SizedBox(height: AppTheme.spacingLG),

              // 3. Expense Details Card (Date, Paid Via, Note, Attachment)
              _buildExpenseDetailsCard(context),
              const SizedBox(height: AppTheme.spacingLG),

              // 4. Drawer Impact Card
              _buildDrawerImpactCard(),
              const SizedBox(height: AppTheme.spacingLG),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigation(context, 'Save Expense'),
    );
  }

  /// 1. Expense Amount Card
  Widget _buildExpenseAmountCard() {
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
          // Header Row: Title + Required Badge + Currency Pill
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Expense Amount",
                    style: AppTypography.h3.copyWith(
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
                      color: const Color(0xFFFEE2E2),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusPill,
                      ),
                    ),
                    child: Text(
                      "Required",
                      style: AppTypography.badge.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFEF4444),
                      ),
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
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                ),
                child: Text(
                  "PKR / Rs",
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Big Amount Input Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.cardSurface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
              border: Border.all(
                color: AppColors.border,
                width: AppDimensions.borderWidth,
              ),
            ),
            child: Row(
              children: [
                Text(
                  "Rs ",
                  style: AppTypography.h1.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: controller.amountController,
                    keyboardType: TextInputType.number,
                    style: AppTypography.displayMedium.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                    decoration: const InputDecoration(
                      hintText: "0",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: controller.clearAmount,
                  child: const Icon(
                    Icons.cancel_outlined,
                    color: AppColors.textMuted,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Quick Action Increment Chips (+500, +1,000, +5,000, Round)
          Row(
            children: [
              _buildQuickAmountChip(
                "+500",
                () => controller.addQuickAmount(500),
              ),
              const SizedBox(width: 8),
              _buildQuickAmountChip(
                "+1,000",
                () => controller.addQuickAmount(1000),
              ),
              const SizedBox(width: 8),
              _buildQuickAmountChip(
                "+5,000",
                () => controller.addQuickAmount(5000),
              ),
              const SizedBox(width: 8),
              _buildQuickAmountChip("Round", controller.roundAmount),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAmountChip(String label, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.cardSurface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
            border: Border.all(
              color: AppColors.border,
              width: AppDimensions.borderWidth,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x06000000),
                blurRadius: 4,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 2. Expense Category Card (2x4 Grid)
  Widget _buildExpenseCategoryCard() {
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
                  Text(
                    "Expense Category",
                    style: AppTypography.h3.copyWith(
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
                      "1 SELECTED",
                      style: AppTypography.badge.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Tap to pick",
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // 2 Rows x 4 Columns Category Grid
          Obx(() {
            final selectedIdx = controller.selectedCategoryIndex.value;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.92,
              ),
              itemBuilder: (context, index) {
                final item = controller.categories[index];
                final isSelected = selectedIdx == index;

                return GestureDetector(
                  onTap: () => controller.selectCategory(index),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusLG,
                          ),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.border,
                            width: isSelected ? 1.8 : 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.primaryLight,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                item.icon,
                                size: 18,
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.bodySmall.copyWith(
                                fontSize: 11,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        Positioned(
                          top: -4,
                          right: -4,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12,
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
      ),
    );
  }

  /// 3. Expense Details Card (Date, Paid Via, Note, Attachment)
  Widget _buildExpenseDetailsCard(BuildContext context) {
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
          // 3.1 Expense Date
          Text(
            "Expense Date",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
          GestureDetector(
            onTap: () => controller.pickDate(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
                    Icons.calendar_month_outlined,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 10),
                  Obx(
                    () => Text(
                      controller.formattedDate,
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Change",
                    style: AppTypography.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppTheme.spacingLG),

          // 3.2 Paid Via
          Text(
            "Paid Via",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
          Obx(() {
            final selectedIdx = controller.selectedPaymentIndex.value;
            return Row(
              children: List.generate(controller.paymentMethods.length, (
                index,
              ) {
                final method = controller.paymentMethods[index];
                final isSelected = selectedIdx == index;

                return Expanded(
                  child: GestureDetector(
                    onTap: () => controller.selectPaymentMethod(index),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 0 : 4,
                        right: index == controller.paymentMethods.length - 1
                            ? 0
                            : 4,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusLG,
                        ),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.border,
                          width: isSelected ? 1.8 : 1.0,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                method.icon,
                                size: 18,
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.textSecondary,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                method.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                method.subtitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.bodySmall.copyWith(
                                  fontSize: 9.5,
                                  color: AppColors.textMuted,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          if (isSelected)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 7,
                                height: 7,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
          const SizedBox(height: AppTheme.spacingLG),

          // 3.3 Internal Note
          Text(
            "Internal Note",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
              border: Border.all(
                color: AppColors.border,
                width: AppDimensions.borderWidth,
              ),
            ),
            child: TextField(
              controller: controller.noteController,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              decoration: const InputDecoration(
                hintText: "Enter note or reason...",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: AppTheme.spacingLG),

          // 3.4 Attach Bill / Receipt
          Text(
            "Attach Bill / Receipt",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSM),
          Obx(() {
            final receipt = controller.selectedReceipt.value;

            if (receipt != null) {
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                  border: Border.all(color: AppColors.primaryContainer),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        receipt,
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Receipt Attached",
                            style: AppTypography.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            receipt.path.split(RegExp(r'[\\/]')).last,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.bodySmall.copyWith(
                              fontSize: 10,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColors.error,
                        size: 20,
                      ),
                      onPressed: controller.removeReceipt,
                    ),
                  ],
                ),
              );
            }

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                border: Border.all(
                  color: AppColors.borderSubtle,
                  width: 1.2,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.receipt_long_outlined,
                      size: 20,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upload Document",
                          style: AppTypography.bodyMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "PDF, JPG or PNG up to 10MB",
                          style: AppTypography.bodySmall.copyWith(
                            fontSize: 11,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.pickReceipt(ImageSource.camera),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.camera_alt_outlined,
                            size: 15,
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
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  /// 4. Drawer Impact Card
  Widget _buildDrawerImpactCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F4FF),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        border: Border.all(
          color: const Color(0xFFEDE9FE),
          width: AppDimensions.borderWidth,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: AppColors.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.trending_down_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Drawer Impact",
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Deducted from Cash\nRegister",
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Ending Balance",
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Obx(
                () => Text(
                  "Rs ${controller.endingBalanceFormatted}",
                  style: AppTypography.h3.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 5. Action Buttons (Save Expense & Save and Add Another)
}

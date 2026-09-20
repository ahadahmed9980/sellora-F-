import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sellora/controller/setup1.controller.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/build_header.dart';
import 'package:sellora/widgets/button.dart';
import 'package:sellora/widgets/formfield.dart';

class Setup1 extends StatelessWidget {
  Setup1({super.key});
  final Setup1controller controller = Get.find<Setup1controller>();

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
            padding: AppTheme.screenPadding,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                buildHeader("step 1 of 2"),
                const SizedBox(height: AppTheme.spacingMD),
                topLines(),
                const SizedBox(height: AppTheme.spacingLG),
                buildMainCard(controller, context),
                const SizedBox(height: AppTheme.spacingXL),
                buildFooter(),
                const SizedBox(height: AppTheme.spacingLG),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //progress lines
  Widget topLines() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 5,
            width: 50,
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
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.textDisabled,
              borderRadius: BorderRadius.circular(AppTheme.radiusLG),
            ),
          ),
        ),
      ],
    );
  }

  //white card with form fields
  Widget buildMainCard(Setup1controller controller, BuildContext context) {
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
        children: [
          // Title & Subtitle
          Text(
            "Set up your profile",
            style: AppTypography.displayMedium.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.spacingSM),
          Text(
            "Add your personal details to personalize\nyour store manager account",
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.spacingXL),

          // Profile Photo Avatar with Camera Badge
          buildAvatarPicker(controller),
          const SizedBox(height: AppTheme.spacingXL),

          // Owner Full Name
          DynamicTextFormField(
            controller: controller.nameController,
            prefixIcon: Icons.badge_outlined,
            labelText: "Owner Full Name",
            hintText: "Maya Lin",
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Phone Number with Country Code Dropdown
          buildPhoneField(controller),
          const SizedBox(height: AppTheme.spacingMD),

          // Email Address
          DynamicTextFormField(
            controller: controller.emailController,
            prefixIcon: Icons.mail_outline_rounded,
            labelText: "Email Address",
            hintText: "maya@lunaboutique.com",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppTheme.spacingXL),

          // Continue Button
          customButton(context, "Continue", () {
            context.push('/setup2');
          }),

          const SizedBox(height: AppTheme.spacingLG),

          // Security Trust Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.gpp_good_outlined,
                color: AppColors.success,
                size: 20,
              ),
              const SizedBox(width: AppTheme.spacingSM),
              Expanded(
                child: Text(
                  "Your information is secure and only used for account management.",
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Profile Avatar Picker with Camera Badge and Upload Photo action
  Widget buildAvatarPicker(Setup1controller controller) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Obx(() {
              final pickedFile = controller.selectedImage.value;
              return GestureDetector(
                onTap: controller.pickimageFromGallery,
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFEFF4FF),
                    border: Border.all(
                      color: const Color(0xFFEDE9FE),
                      width: 3,
                    ),
                    image: pickedFile != null
                        ? DecorationImage(
                            image: FileImage(pickedFile),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: pickedFile == null
                      ? const Center(
                          child: Icon(
                            Icons.person_outline_rounded,
                            size: 42,
                            color: AppColors.primary,
                          ),
                        )
                      : null,
                ),
              );
            }),

            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.cardSurface, width: 2.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x336D5DF6),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingSM),
        Text(
          "Upload Photo",
          style: AppTypography.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  /// Phone Number field with country code pill and suffix phone icon using DynamicTextFormField
  Widget buildPhoneField(Setup1controller controller) {
    return DynamicTextFormField(
      controller: controller.phoneController,
      labelText: "Phone Number",
      hintText: "+92 300 1234567",
      keyboardType: TextInputType.phone,
      suffixIcon: Icons.phone_outlined,
      prefixWidget: Obx(
        () => PopupMenuButton<String>(
          tooltip: "Select Country Code",
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
          ),
          onSelected: (code) {
            controller.updateCountryCode(code);
          },
          itemBuilder: (context) => controller.countryCodes.map((code) {
            return PopupMenuItem<String>(
              value: code,
              child: Text(
                code,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: AppColors.containerLow,
              borderRadius: BorderRadius.circular(
                AppDimensions.radiusPill,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.selectedCountryCode.value,
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
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
        ),
      ),
    );
  }

  /// Footer row for Sellora Support
  Widget buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Need assistance? ",
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint("Contact Sellora Support tapped");
          },
          child: Text(
            "Contact Sellora Support",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

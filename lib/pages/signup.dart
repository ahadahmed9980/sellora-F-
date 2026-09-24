import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sellora/controller/signup.controller.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/formfield.dart';
import 'package:sellora/widgets/buttons/socialbutton.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final Signupcontroller controller = Get.find<Signupcontroller>();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.splashScreenGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: AppTheme.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Header (Sellora Brand Pill, POS Badge)
                buildHeader(),
                const SizedBox(height: AppTheme.spacingMD),

                // 3D Shop Illustration
                Image.asset(
                  "assets/images/signup1.png",
                  height: 110,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: AppTheme.spacingLG),

                // Title & Subtitle
                Text(
                  "Create your account",
                  style: AppTypography.displayMedium.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  "Start managing your shop in minutes",
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.spacingLG),

                // Main White Card Container
                buildMainCard(controller),
                const SizedBox(height: AppTheme.spacingXL),

                // Footer (Already have an account? Sign in)
                buildFooter(context),
                const SizedBox(height: AppTheme.spacingLG),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Top Header with Sellora Pill and POS Badge
  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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

        // POS Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: BorderRadius.circular(AppTheme.radiusPill),
          ),
          child: Text(
            "POS",
            style: AppTypography.badge.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }

  /// Main White Card Container with Form Fields, Terms Checkbox, Button, and Social Logins
  Widget buildMainCard(Signupcontroller controller) {
    return Container(
      width: double.infinity,
      padding: AppTheme.cardPadding,
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
          // Email Address
          DynamicTextFormField(
            controller: controller.emailController,
            prefixIcon: Icons.email_outlined,
            labelText: "Email Address",
            hintText: "mayaluna@boutique.com",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Password
          DynamicTextFormField(
            controller: controller.passwordController,
            prefixIcon: Icons.lock_outline,
            labelText: "Password",
            hintText: "******",
            isPassword: true,
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Confirm Password
          DynamicTextFormField(
            controller: controller.confirmPasswordController,
            prefixIcon: Icons.lock_outline,
            labelText: "Confirm Password",
            hintText: "******",
            isPassword: true,
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Terms of Service & Privacy Policy Checkbox
          buildTermsCheckbox(controller),
          const SizedBox(height: AppTheme.spacingLG),

          // Create Account Button
          ElevatedButton(
            onPressed: () {
              // Sign up action
            },
            child: const Text('Create Account'),
          ),
          const SizedBox(height: AppTheme.spacingXXL),

          // "or continue with" Divider
          buildOrDivider(),
          const SizedBox(height: AppTheme.spacingLG),

          // Continue with Google Button
          buildSocialButton(
            text: "Continue with Google",
            iconPath: "assets/images/google.png",
            onTap: () {},
          ),
          const SizedBox(height: AppTheme.spacingMD),

          // Continue with Apple Button
          buildSocialButton(
            text: "Continue with Apple",
            iconPath: "assets/images/apple.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  /// Terms of Service & Privacy Policy Checkbox Row using GetX RxBool
  Widget buildTermsCheckbox(Signupcontroller controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 22,
          width: 22,
          child: Obx(
            () => Checkbox(
              value: controller.agreeToTerms.value,
              activeColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusXS),
              ),
              side: const BorderSide(
                color: AppColors.border,
                width: AppDimensions.borderWidthFocused,
              ),
              onChanged: (val) {
                controller.toggleTerms(val);
              },
            ),
          ),
        ),
        const SizedBox(width: AppTheme.spacingSM),
        Expanded(
          child: GestureDetector(
            onTap: () {
              controller.toggleTerms();
            },
            child: Text.rich(
              TextSpan(
                text: "I agree to the ",
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                children: [
                  TextSpan(
                    text: "Terms of Service",
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: " & ",
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// "or continue with" horizontal divider
  Widget buildOrDivider() {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.border,
            thickness: AppTheme.borderWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMD),
          child: Text(
            "or continue with",
            style: AppTypography.bodySmall.copyWith(color: AppColors.textMuted),
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.border,
            thickness: AppTheme.borderWidth,
          ),
        ),
      ],
    );
  }



  /// Bottom Footer Row (Already have an account? Sign in)
  Widget buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.goNamed('signin');
            debugPrint("clicked sigin ");
          },
          child: Text(
            "Sign in",
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

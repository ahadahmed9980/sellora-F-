import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:go_router/go_router.dart';
import 'package:sellora/controller/signin.controller.dart';
import 'package:sellora/utils/theme/app_colors.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/utils/theme/app_typography.dart';
import 'package:sellora/widgets/formfield.dart';
import 'package:sellora/widgets/socialbutton.dart';

class Signin extends StatelessWidget {
  final Signincontroller controller = Get.find<Signincontroller>();
  Signin({super.key});

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
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingLG,
              vertical: AppTheme.spacingMD,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Header (Sellora Brand Pill, POS Badge)
                buildHeader(),
                const SizedBox(height: AppTheme.spacingMD),

                // 3D Shop Illustration
                Image.asset(
                  "assets/images/signin.png",
                  height: 110,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: AppTheme.spacingLG),

                // Title & Subtitle
                Text(
                  "Welcome back",
                  style: AppTypography.displayMedium.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  "Sign in to continue to your shop",
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

        // terminal Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: BorderRadius.circular(AppTheme.radiusPill),
          ),
          child: Text(
            "Terminal Active",
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
  Widget buildMainCard(Signincontroller controller) {
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
          // Full Name

          // Email Address
          DynamicTextFormField(
            controller: controller.emailController,
            prefixIcon: Icons.email_outlined,
            labelText: "Email Address",
            hintText: "mayaluna@boutique.com",
            keyboardType: TextInputType.emailAddress,
          ),
          // const SizedBox(height: AppTheme.spacingMD),

          // Password
          DynamicTextFormField(
            controller: controller.passwordController,
            prefixIcon: Icons.lock_outline,
            labelText: "Password",
            hintText: "******",
            isPassword: true,
          ),
          const SizedBox(height: AppTheme.spacingMD),

  
  

          // Create Account Button
          ElevatedButton(
            onPressed: () {
              // Sign up action
            
            },
            child: Text('Sign In'),
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

  /// Social Login Outlined Pill Button (Google / Apple)

  /// Bottom Footer Row (Already have an account? Sign in)
  Widget buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New to Sellora? ",
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to Sign in screen
            context.goNamed('signup');
          },
          child: Text(
            "Create account",
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

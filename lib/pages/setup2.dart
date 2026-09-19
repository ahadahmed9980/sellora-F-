import 'package:flutter/material.dart';
import 'package:sellora/utils/theme/app_colors.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/build_header.dart';

class Setup2 extends StatelessWidget {
  const Setup2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.splashScreenGradient,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: AppTheme.screenPadding,
          child: SafeArea(
            child: Column(
              children: [
                buildHeader("step 2 of 2"),
                const SizedBox(height: AppTheme.spacingMD),
                topLines(),
                const SizedBox(height: AppTheme.spacingLG),
                Image.asset(
                  "assets/images/setup2.png",
                  height: 110,
                  fit: BoxFit.contain,
                ),
                    Text(
            "Set up your profile",
            style: AppTypography.displayMedium.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppTheme.radiusLG),
            ),
          ),
        ),
      ],
    );
  }
}

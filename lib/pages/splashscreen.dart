import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sellora/utils/theme/app_theme.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.splashScreenGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                border: Border.all(
                  color: AppColors.border,
                  width: AppTheme.borderWidth,
                ),
              ),
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: AppTheme.spacingLG),
            //point of sale
            pointOfSale(),
      

            const SizedBox(height: AppTheme.spacingXL),
            //title
            Text("SELLORA", style: AppTypography.displayLarge),
            const SizedBox(height: AppTheme.spacingSM),
            Text(
              "Smart Shop, Smart Sales ",
              style: AppTypography.h2.copyWith(color: Colors.grey),
            ),
            Spacer(),
            LoadingAnimationWidget.waveDots(color: AppColors.primary, size: 35),
            const SizedBox(height: AppTheme.spacingXXXL),
          ],
        ),
      ),
    );
  }
}

Widget pointOfSale() {
  return
  //point of sale
  Container(
    padding: EdgeInsets.all(7),

    decoration: BoxDecoration(
      boxShadow: AppTheme.cardShadow,
      color: AppColors.cardSurface,
      borderRadius: BorderRadius.circular(AppTheme.radiusXL),
      border: Border.all(color: AppColors.border, width: AppTheme.borderWidth),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.storefront_outlined, color: AppColors.primary),
        const SizedBox(width: AppTheme.spacingXS),
        Text(
          "POINT OF SALE",
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

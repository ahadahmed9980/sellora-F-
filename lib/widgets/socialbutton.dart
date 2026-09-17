import 'package:flutter/material.dart';
import 'package:sellora/utils/theme/app_theme.dart';

Widget buildSocialButton({
    required String text,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.cardSurface,
        foregroundColor: AppColors.textPrimary,
        minimumSize: const Size.fromHeight(50),
        side: const BorderSide(
          color: AppColors.border,
          width: AppTheme.borderWidth,
        ),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingLG,
          vertical: AppTheme.spacingMD,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 20, width: 20),
          const SizedBox(width: AppTheme.spacingMD),
          Text(
            text,
            style: AppTypography.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

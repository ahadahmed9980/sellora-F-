import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sellora/utils/theme/app_colors.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/utils/theme/app_typography.dart';

   PreferredSizeWidget buildAppBar(BuildContext context,String title,subTitle) {
    return AppBar(
      backgroundColor: AppColors.surfaceBackground,
      elevation: 0,
      toolbarHeight: 72,
      leadingWidth: 68,
      leading: Center(
        child: Material(
          shape: const CircleBorder(),
          child: InkWell(
            onTap: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                context.pop();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.border,
                  width: AppTheme.borderWidth,
                ),
                boxShadow: AppTheme.cardShadow,
           
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 20,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: AppTypography.h1),
          const SizedBox(height: 2),
          Text(
           subTitle,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
      actions: [
        const SizedBox(width: AppTheme.spacingSM),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.info_outline_rounded,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: AppTheme.spacingSM),
      ],
    );
  }
 
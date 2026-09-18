import 'package:flutter/material.dart';
import 'package:sellora/utils/theme/app_colors.dart';
import 'package:sellora/utils/theme/app_theme.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppTheme.radiusMD),
                border: Border.all(
                  color: AppColors.border,
                  width: AppTheme.borderWidth,
                ),
              ),
              child: const Icon(
                Icons.store_mall_directory_rounded,
                color: AppColors.textOnPrimary,
                size: 30,
              ),
            ),
            SizedBox(width: AppTheme.spacingXS),
            //column
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Luna Boutique", style: AppTheme.navLabel),
                SizedBox(height: AppTheme.spacingXS),
                Text("Good Evening Ahad", style: AppTheme.h1),
                SizedBox(height: AppTheme.spacingXS),
                Text(
                  "Here is  your business overview today ✨",
                  style: AppTheme.navLabel,
                ),
              ],
            ),
          ],
        ),
        actions: [
          // Notification
          IconButton(
            onPressed: () {
              // Open notifications
            },
            icon: const Icon(Icons.notifications_none_rounded),
          ),

          const SizedBox(width: 4),

          // Profile
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                // Open profile
              },
              child: Container(   height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppTheme.radiusMD),
                border: Border.all(
                  color: AppColors.border,
                  width: AppTheme.borderWidth,
                ),
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

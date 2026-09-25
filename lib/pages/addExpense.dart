import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/appbar.dart';
import 'package:sellora/widgets/buttons/bottomNavigation.dart';
import 'package:sellora/widgets/formfield.dart';

class Addexpense extends StatelessWidget {
  const Addexpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: buildAppBar(context, 'Add Exdpense', "Manager Business Outflow"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: AppTheme.screenPadding,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: AppTheme.spacingSM),
              Container(
                height: 150,
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expense Amount', style: AppTheme.h1),
                    const SizedBox(height: AppTheme.spacingXS),
                    DynamicTextFormField(
                      hintText: '1000',
                      prefixIcon: Icons.currency_rupee_outlined,
                      suffixIcon: Icons.abc_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigation(context, 'Save Expense'),
    );
  }
}

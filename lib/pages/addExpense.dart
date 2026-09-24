import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sellora/utils/theme/app_theme.dart';
import 'package:sellora/widgets/appbar.dart';
import 'package:sellora/widgets/buttons/bottomNavigation.dart';

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
          child: Column(children: [
            
            ],
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigation(context, 'Save Expense'),
    );
  }
}

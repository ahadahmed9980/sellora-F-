import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellora/models/quickactionModel.dart';
import 'package:sellora/utils/theme/app_colors.dart';

class Homepagecontroller extends GetxController {
  final quickActions = <QuickActionModel>[
    const QuickActionModel(
      title: 'New Sale',
      icon: Icons.point_of_sale_rounded,
      backgroundColor: AppColors.primary,
      iconColor: AppColors.textOnPrimary,
      textColor: AppColors.primary,
      isPrimary: true,
      route: '/new-sale',
    ),
    const QuickActionModel(
      title: 'Scan Item',
      icon: Icons.qr_code_scanner_rounded,
      backgroundColor: Colors.white,
      iconColor: Color(0xFF1E293B),
      textColor: Color(0xFF334155),
      isPrimary: false,
      route: '/scan-item',
    ),
    const QuickActionModel(
      title: 'Add Prod.',
      icon: Icons.add_box_outlined,
      backgroundColor: Colors.white,
      iconColor: Color(0xFF1E293B),
      textColor: Color(0xFF334155),
      isPrimary: false,
      route: '/add-product',
    ),
    const QuickActionModel(
      title: 'Add Stock',
      icon: Icons.warehouse_outlined,
      backgroundColor: Colors.white,
      iconColor: Color(0xFF1E293B),
      textColor: Color(0xFF334155),
      isPrimary: false,
      route: '/add-stock',
    ),
    const QuickActionModel(
      title: 'Payments',
      icon: Icons.payments_outlined,
      backgroundColor: Colors.white,
      iconColor: Color(0xFF1E293B),
      textColor: Color(0xFF334155),
      isPrimary: false,
      route: '/payments',
    ),
    const QuickActionModel(
      title: 'Add Expense',
      icon: Icons.account_balance_wallet_outlined,
      backgroundColor: Colors.white,
      iconColor: Color(0xFF1E293B),
      textColor: Color(0xFF334155),
      isPrimary: false,
      route: '/add-expense',
    ),
  ].obs;
}

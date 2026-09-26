import 'package:flutter/widgets.dart';

class PaymentMethodItem {
  final String title;
  final String subtitle;
  final IconData icon;

  PaymentMethodItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class ExpenseCategoryItem {
  final String title;
  final IconData icon;

  ExpenseCategoryItem({
    required this.title,
    required this.icon,
  });
}
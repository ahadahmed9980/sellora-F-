import 'package:flutter/material.dart';

class QuickActionModel {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color? textColor;
  final bool isPrimary;
  final String route;

  const QuickActionModel({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    this.textColor,
    this.isPrimary = false,
    required this.route,
  });
}

import 'package:flutter/material.dart';

class CategoryItem {
  final String title;
  final IconData icon;

  CategoryItem({required this.title, required this.icon});
}


class CategoryItemCount {
  final String title;
  final int count;
  final IconData? icon; // Optional rakh sakte hain agar icon har dafa na chahiye ho

  CategoryItemCount({
    required this.title,
    required this.count,
    this.icon,
  });

  // Display ke liye getter: "Beverages (12)"
  String get displayTitle => '$title ($count)';
}
class CurrencyItem {
  final String code;
  final String name;
  final String symbol;
  final bool isDefault;

  CurrencyItem({
    required this.code,
    required this.name,
    required this.symbol,
    this.isDefault = false,
  });
}


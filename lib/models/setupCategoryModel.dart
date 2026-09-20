import 'package:flutter/material.dart';

class CategoryItem {
  final String title;
  final IconData icon;

  CategoryItem({required this.title, required this.icon});
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


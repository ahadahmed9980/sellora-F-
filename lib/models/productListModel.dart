import 'package:flutter/material.dart';

class ProductListModel {
  final String title;
  final String price;
  final String category;
  final String sku;
  final String stockText;
  final bool isLowStock;
  final String profitText;
  final IconData icon;

  const ProductListModel({
    required this.title,
    required this.price,
    required this.category,
    required this.sku,
    required this.stockText,
    this.isLowStock = false,
    required this.profitText,
    required this.icon,
  });
}
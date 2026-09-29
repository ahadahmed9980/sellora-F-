import 'package:flutter/material.dart';

/// Model representing a category icon choice in the selection grid.
class CategoryIconItem {
  final String id;
  final String label;
  final IconData icon;

  const CategoryIconItem({
    required this.id,
    required this.label,
    required this.icon,
  });
}

/// Model representing a category color swatch tag.
class CategoryColorItem {
  final String name;
  final Color color;
  final String hex;

  const CategoryColorItem({
    required this.name,
    required this.color,
    required this.hex,
  });
}

/// Full Category model for persistence & state management.
class AddCategoryModel {
  final String? id;
  final String name;
  final String iconId;
  final String colorName;
  final String colorHex;
  final String description;
  final DateTime? createdAt;

  AddCategoryModel({
    this.id,
    required this.name,
    required this.iconId,
    required this.colorName,
    required this.colorHex,
    this.description = '',
    this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'iconId': iconId,
    'colorName': colorName,
    'colorHex': colorHex,
    'description': description,
    'createdAt': createdAt?.toIso8601String(),
  };

  factory AddCategoryModel.fromJson(Map<String, dynamic> json) =>
      AddCategoryModel(
        id: json['id'],
        name: json['name'] ?? '',
        iconId: json['iconId'] ?? '',
        colorName: json['colorName'] ?? '',
        colorHex: json['colorHex'] ?? '',
        description: json['description'] ?? '',
        createdAt: json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'])
            : null,
      );
}

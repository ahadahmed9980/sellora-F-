import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sellora/models/productListModel.dart';
import 'package:sellora/models/setupCategoryModel.dart';

class Productlistcontroller extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxInt selectedIndex = 0.obs;

  // product  list controller
  final RxList<CategoryItemCount> setupCategories = <CategoryItemCount>[
    CategoryItemCount(title: "All", count: 1),
    CategoryItemCount(title: "Beverages", count: 1),
    CategoryItemCount(title: "Snacks", count: 1),
    CategoryItemCount(title: "Grocery", count: 1),
    CategoryItemCount(title: "Others", count: 1),
  ].obs;
  // product lsit
  final RxList<ProductListModel> productsList = <ProductListModel>[
    const ProductListModel(
      title: "Coca Cola 1.5L",
      price: "220",
      category: "beverages",
      sku: "SKU-89012",
      stockText: "24 left ",
      isLowStock: true,
      profitText: "40/unit (18.2%)",
      icon: Icons.local_drink_outlined,
    ),

    // 2. Lays Classic Salted 65g
    const ProductListModel(
      title: "Lays Classic Salted 65g",
      price: "100",
      category: "snacks",
      sku: "SKU-77201",
      stockText: "142 in stock",
      isLowStock: false,
      profitText: "22/unit (22.0%)",
      icon: Icons.bakery_dining_outlined,
    ),

    // 3. Nestlé Pure Life 1.5L
    const ProductListModel(
      title: "Nestlé Pure Life 1.5L",
      price: "110",
      category: "beverages",
      sku: "SKU-65412",
      stockText: "180 left ",
      isLowStock: true,
      profitText: "25/unit (22.7%)",
      icon: Icons.local_drink_outlined,
    ),

    // 4. Premium Basmati Rice 5kg
    const ProductListModel(
      title: "Premium Basmati Rice 5kg",
      price: "1,540",
      category: "groceries",
      sku: "SKU-99031",
      stockText: "50 in stock",
      isLowStock: false,
      profitText: "210/unit (13.6%)",
      icon: Icons.shopping_bag_outlined,
    ),
  ].obs;
}

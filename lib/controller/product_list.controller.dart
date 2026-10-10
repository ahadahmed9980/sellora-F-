import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
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
}

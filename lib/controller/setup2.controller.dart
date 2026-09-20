import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellora/models/setupCategoryModel.dart';

class Setup2controller extends GetxController {
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController storeAddressController = TextEditingController();

  final RxInt selectedIndex = 1.obs;

  final RxList<CategoryItem> setupcategories = <CategoryItem>[
    CategoryItem(
      title: "Grocery",
      icon: Icons.shopping_bag_outlined,
    ),
    CategoryItem(
      title: "Bakery",
      icon: Icons.bakery_dining_outlined,
    ),
    CategoryItem(
      title: "Pharmacy",
      icon: Icons.local_pharmacy_outlined,
    ),
  ].obs;

  final Rx<CurrencyItem> selectedCurrency = CurrencyItem(
    code: "PKR (Rs)",
    name: "Pakistani Rupee",
    symbol: "Rs",
    isDefault: true,
  ).obs;

  final List<CurrencyItem> currencies = [
    CurrencyItem(
      code: "PKR (Rs)",
      name: "Pakistani Rupee",
      symbol: "Rs",
      isDefault: true,
    ),
    CurrencyItem(
      code: "USD (\$)",
      name: "US Dollar",
      symbol: "\$",
      isDefault: false,
    ),
    CurrencyItem(
      code: "EUR (€)",
      name: "Euro",
      symbol: "€",
      isDefault: false,
    ),
    CurrencyItem(
      code: "GBP (£)",
      name: "British Pound",
      symbol: "£",
      isDefault: false,
    ),
    CurrencyItem(
      code: "AED (AED)",
      name: "UAE Dirham",
      symbol: "AED",
      isDefault: false,
    ),
    CurrencyItem(
      code: "SAR (SAR)",
      name: "Saudi Riyal",
      symbol: "SAR",
      isDefault: false,
    ),
  ];

  void updateIndex(int index) {
    selectedIndex.value = index;
      print("Selected index: $index");
  }

  void updateCurrency(CurrencyItem item) {
    selectedCurrency.value = item;
  }

  @override
  void onClose() {
    shopNameController.dispose();
    storeAddressController.dispose();
    super.onClose();
  }
}

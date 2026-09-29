import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellora/models/addCategoryModel.dart';
import 'package:sellora/utils/theme/app_colors.dart';

class Addcategorycontroller extends GetxController {
  // Form Controllers
  final TextEditingController nameController = TextEditingController(
    text: "Beverages & Drinks",
  );
  final TextEditingController descriptionController = TextEditingController(
    text: "Cold drinks, packaged juices, sodas",
  );

  // Form Reactive States
  final RxInt descriptionLength = 35.obs;
  final RxBool hasCategoryName = true.obs;

  // 12 Category Icons (3 rows x 4 columns)
  final RxInt selectedIconIndex = 0.obs;
  final List<CategoryIconItem> categoryIcons = const [
    CategoryIconItem(
      id: "coffee",
      label: "Beverages",
      icon: Icons.emoji_food_beverage_outlined,
    ),
    CategoryIconItem(
      id: "bar",
      label: "Bar & Drinks",
      icon: Icons.local_bar_outlined,
    ),
    CategoryIconItem(
      id: "dining",
      label: "Restaurant & Food",
      icon: Icons.restaurant_outlined,
    ),
    CategoryIconItem(
      id: "fastfood",
      label: "Fast Food",
      icon: Icons.fastfood_outlined,
    ),
    CategoryIconItem(
      id: "cart",
      label: "Grocery & Retail",
      icon: Icons.shopping_cart_outlined,
    ),
    CategoryIconItem(
      id: "bag",
      label: "Shopping",
      icon: Icons.shopping_bag_outlined,
    ),
    CategoryIconItem(
      id: "bakery",
      label: "Bakery & Sweets",
      icon: Icons.bakery_dining_outlined,
    ),
    CategoryIconItem(
      id: "pharmacy",
      label: "Pharmacy & Health",
      icon: Icons.medical_services_outlined,
    ),
    CategoryIconItem(
      id: "eco",
      label: "Organic & Herbal",
      icon: Icons.eco_outlined,
    ),
    CategoryIconItem(
      id: "clothes",
      label: "Clothing & Apparel",
      icon: Icons.checkroom_outlined,
    ),
    CategoryIconItem(
      id: "devices",
      label: "Electronics",
      icon: Icons.devices_outlined,
    ),
    CategoryIconItem(
      id: "gaming",
      label: "Gaming & Entertainment",
      icon: Icons.sports_esports_outlined,
    ),
  ];

  void selectIcon(int index) {
    if (index >= 0 && index < categoryIcons.length) {
      selectedIconIndex.value = index;
    }
  }

  // 8 Color Swatches (2 rows x 4 columns)
  final RxInt selectedColorIndex = 0.obs;
  final List<CategoryColorItem> colorSwatches = const [
    CategoryColorItem(
      name: "Royal Violet",
      color: Color(0xFF6D5DF6),
      hex: "#6D5DF6",
    ),
    CategoryColorItem(
      name: "Emerald Green",
      color: Color(0xFF10B981),
      hex: "#10B981",
    ),
    CategoryColorItem(
      name: "Amber Orange",
      color: Color(0xFFF59E0B),
      hex: "#F59E0B",
    ),
    CategoryColorItem(
      name: "Sky Blue",
      color: Color(0xFF0EA5E9),
      hex: "#0EA5E9",
    ),
    CategoryColorItem(
      name: "Coral Red",
      color: Color(0xFFEF4444),
      hex: "#EF4444",
    ),
    CategoryColorItem(
      name: "Indigo Night",
      color: Color(0xFF4F46E5),
      hex: "#4F46E5",
    ),
    CategoryColorItem(
      name: "Sunset Orange",
      color: Color(0xFFF97316),
      hex: "#F97316",
    ),
    CategoryColorItem(
      name: "Teal Cyan",
      color: Color(0xFF14B8A6),
      hex: "#14B8A6",
    ),
  ];

  void selectColor(int index) {
    if (index >= 0 && index < colorSwatches.length) {
      selectedColorIndex.value = index;
    }
  }

  String get selectedColorName {
    if (selectedColorIndex.value >= 0 &&
        selectedColorIndex.value < colorSwatches.length) {
      return colorSwatches[selectedColorIndex.value].name;
    }
    return "Royal Violet";
  }

  Color get selectedColor {
    if (selectedColorIndex.value >= 0 &&
        selectedColorIndex.value < colorSwatches.length) {
      return colorSwatches[selectedColorIndex.value].color;
    }
    return AppColors.primary;
  }

  void clearName() {
    nameController.clear();
    hasCategoryName.value = false;
  }

  void clearForm() {
    nameController.clear();
    descriptionController.clear();
    selectedIconIndex.value = 0;
    selectedColorIndex.value = 0;
    descriptionLength.value = 0;
    hasCategoryName.value = false;
  }

  void saveCategory({bool addAnother = false}) {
    final name = nameController.text.trim();
    if (name.isEmpty) {
      Get.snackbar(
        "Required",
        "Please enter a category name",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 14,
        duration: const Duration(seconds: 2),
      );
      return;
    }

    final category = AddCategoryModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      iconId: categoryIcons[selectedIconIndex.value].id,
      colorName: colorSwatches[selectedColorIndex.value].name,
      colorHex: colorSwatches[selectedColorIndex.value].hex,
      description: descriptionController.text.trim(),
      createdAt: DateTime.now(),
    );

    Get.snackbar(
      "Success",
      "Category '${category.name}' saved successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 14,
      duration: const Duration(seconds: 2),
    );

    if (addAnother) {
      clearForm();
    }
  }

  @override
  void onInit() {
    super.onInit();
    descriptionLength.value = descriptionController.text.length;
    hasCategoryName.value = nameController.text.trim().isNotEmpty;

    descriptionController.addListener(() {
      descriptionLength.value = descriptionController.text.length;
    });

    nameController.addListener(() {
      hasCategoryName.value = nameController.text.trim().isNotEmpty;
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
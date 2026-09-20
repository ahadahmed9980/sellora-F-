import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellora/models/setupCategoryModel.dart';

class Addproductcontroller extends GetxController {
  // Form Controllers
  final TextEditingController productNameController = TextEditingController(
    text: "",
  );
  final TextEditingController skuController = TextEditingController(
    text: "",
  );
  final TextEditingController barcodeController = TextEditingController(
    text: "",
  );
  final TextEditingController costPriceController = TextEditingController(
    text: "",
  );
  final TextEditingController sellingPriceController = TextEditingController(
    text: "",
  );
  final TextEditingController currentStockController = TextEditingController(
    text: "",
  );
  final TextEditingController lowStockAlertController = TextEditingController(
    text: "",
  );
  final TextEditingController descriptionController = TextEditingController();

  // Image Upload & Compression
  final Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1024,
      maxHeight: 1024,
    );

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  void removeImage() {
    selectedImage.value = null;
  }

  // Categories
  final RxInt selectedCategoryIndex = 0.obs;
  final RxList<CategoryItem> categories = <CategoryItem>[
    CategoryItem(title: "Beverages", icon: Icons.local_drink_outlined),
    CategoryItem(title: "Snacks", icon: Icons.cookie_outlined),
    CategoryItem(title: "Groceries", icon: Icons.shopping_bag_outlined),
  ].obs;

  void updateCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  void addCategory(String title, IconData icon) {
    categories.add(CategoryItem(title: title, icon: icon));
    selectedCategoryIndex.value = categories.length - 1;
  }

  // SKU Auto-generation
  void generateSKU() {
    final categoryPrefix = categories[selectedCategoryIndex.value].title
        .substring(0, 3)
        .toUpperCase();
    final randomSuffix = DateTime.now().millisecondsSinceEpoch
        .toString()
        .substring(10);
    skuController.text = "SKU-$categoryPrefix-$randomSuffix";
  }

  // Pricing & Margin Engine
  final RxDouble marginPercent = 18.18.obs;
  final RxDouble profitAmount = 40.0.obs;
  final RxDouble markupPercent = 22.2.obs;
  final RxString marginHealth = "HEALTHY".obs;

  void calculateMargin() {
    final double cost = double.tryParse(costPriceController.text) ?? 0.0;
    final double selling = double.tryParse(sellingPriceController.text) ?? 0.0;

    final double profit = selling - cost;
    profitAmount.value = profit;

    if (selling > 0) {
      marginPercent.value = (profit / selling) * 100;
    } else {
      marginPercent.value = 0.0;
    }

    if (cost > 0) {
      markupPercent.value = (profit / cost) * 100;
    } else {
      markupPercent.value = 0.0;
    }

    if (marginPercent.value >= 15.0) {
      marginHealth.value = "HEALTHY";
    } else if (marginPercent.value >= 5.0) {
      marginHealth.value = "MODERATE";
    } else {
      marginHealth.value = "LOW";
    }
  }

  // Stock Management Stepper
  final RxInt stockCount = 48.obs;

  void incrementStock() {
    stockCount.value++;
    currentStockController.text = stockCount.value.toString();
  }

  void decrementStock() {
    if (stockCount.value > 0) {
      stockCount.value--;
      currentStockController.text = stockCount.value.toString();
    }
  }

  // Unit of Measurement
  final RxString selectedUnit = "Bottles (btl)".obs;
  final List<String> units = const [
    "Bottles (btl)",
    "Pieces (pcs)",
    "Kilograms (kg)",
    "Grams (g)",
    "Liters (L)",
    "Pack (pk)",
    "Box (bx)",
  ];

  void updateUnit(String unit) {
    selectedUnit.value = unit;
  }

  // Active in POS Register
  final RxBool isActiveInPOS = true.obs;

  void toggleActiveInPOS(bool value) {
    isActiveInPOS.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    costPriceController.addListener(calculateMargin);
    sellingPriceController.addListener(calculateMargin);
    calculateMargin();
  }

  @override
  void onClose() {
    productNameController.dispose();
    skuController.dispose();
    barcodeController.dispose();
    costPriceController.dispose();
    sellingPriceController.dispose();
    currentStockController.dispose();
    lowStockAlertController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  //barcode
  // var scannedBarcode = ''.obs;

  void updateBarcode(String code) {

    barcodeController.text = code;
  }
}

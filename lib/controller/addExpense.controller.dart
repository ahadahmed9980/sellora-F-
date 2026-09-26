import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellora/models/addExpenseCategoryModel.dart';



class Addexpensecontroller extends GetxController {
  // Form Controllers
  final TextEditingController amountController =
      TextEditingController(text: "8500");
  final TextEditingController noteController =
      TextEditingController(text: "September bill");

  // Expense Amount State
  final RxDouble expenseAmount = 8500.0.obs;

  void updateAmount(String value) {
    final cleanText = value.replaceAll(',', '').trim();
    final parsed = double.tryParse(cleanText) ?? 0.0;
    expenseAmount.value = parsed;
    calculateEndingBalance();
  }

  // Quick Action Buttons (+500, +1000, +5000, Round)
  void addQuickAmount(double addValue) {
    final current = expenseAmount.value;
    final newAmount = current + addValue;
    amountController.text = newAmount.toStringAsFixed(0);
    expenseAmount.value = newAmount;
    calculateEndingBalance();
  }

  void roundAmount() {
    final current = expenseAmount.value;
    if (current <= 0) return;
    double rounded = (current / 500).ceil() * 500.0;
    if (rounded == current) {
      rounded = (current / 1000).ceil() * 1000.0;
    }
    amountController.text = rounded.toStringAsFixed(0);
    expenseAmount.value = rounded;
    calculateEndingBalance();
  }

  void clearAmount() {
    amountController.clear();
    expenseAmount.value = 0.0;
    calculateEndingBalance();
  }

  // 8 Expense Categories (Grid 2x4)
  final RxInt selectedCategoryIndex = 1.obs; // Electricity selected by default
  final List<ExpenseCategoryItem> categories = [
    ExpenseCategoryItem(title: "Rent", icon: Icons.storefront_outlined),
    ExpenseCategoryItem(title: "Electricity", icon: Icons.bolt_rounded),
    ExpenseCategoryItem(title: "Gas", icon: Icons.local_fire_department_outlined),
    ExpenseCategoryItem(title: "Transport", icon: Icons.local_shipping_outlined),
    ExpenseCategoryItem(title: "Repairs", icon: Icons.build_outlined),
    ExpenseCategoryItem(title: "Salaries", icon: Icons.badge_outlined),
    ExpenseCategoryItem(title: "Supplies", icon: Icons.inventory_2_outlined),
    ExpenseCategoryItem(title: "Other", icon: Icons.more_horiz_rounded),
  ];

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  // Expense Date
  final Rx<DateTime> selectedDate = DateTime(2026, 9, 14).obs;

  static const List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  String get formattedDate {
    final date = selectedDate.value;
    return "${date.day} ${_months[date.month - 1]} ${date.year}";
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  // Payment Source (Paid Via: Cash Drawer, Bank Acct, Wallet)
  final RxInt selectedPaymentIndex = 0.obs;
  final List<PaymentMethodItem> paymentMethods = [
    PaymentMethodItem(
      title: "Cash Drawer",
      subtitle: "Register #01",
      icon: Icons.point_of_sale_outlined,
    ),
    PaymentMethodItem(
      title: "Bank Acct",
      subtitle: "HBL *8841",
      icon: Icons.account_balance_outlined,
    ),
    PaymentMethodItem(
      title: "Wallet",
      subtitle: "Business Pay",
      icon: Icons.account_balance_wallet_outlined,
    ),
  ];

  void selectPaymentMethod(int index) {
    selectedPaymentIndex.value = index;
    calculateEndingBalance();
  }

  // Receipt / Bill Attachment (ImagePicker)
  final Rx<File?> selectedReceipt = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickReceipt(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1024,
      maxHeight: 1024,
    );
    if (pickedFile != null) {
      selectedReceipt.value = File(pickedFile.path);
    }
  }

  void removeReceipt() {
    selectedReceipt.value = null;
  }

  // Drawer Impact Calculations
  final RxDouble currentRegisterBalance = 52700.0.obs;
  final RxDouble endingBalance = 44200.0.obs;

  void calculateEndingBalance() {
    if (selectedPaymentIndex.value == 0) {
      endingBalance.value = currentRegisterBalance.value - expenseAmount.value;
    } else {
      endingBalance.value = currentRegisterBalance.value;
    }
  }

  String get endingBalanceFormatted {
    final formatted = endingBalance.value.toStringAsFixed(0);
    return formatted.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  // Save Expense Actions
  void saveExpense({bool addAnother = false}) {
    if (expenseAmount.value <= 0) {
      Get.snackbar(
        "Required",
        "Please enter an expense amount",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 14,
      );
      return;
    }

    final formattedAmount = expenseAmount.value.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );

    Get.snackbar(
      "Success",
      "Expense of Rs $formattedAmount saved successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF6D5DF6),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 14,
      duration: const Duration(seconds: 2),
    );

    if (addAnother) {
      amountController.clear();
      expenseAmount.value = 0.0;
      noteController.clear();
      selectedReceipt.value = null;
      calculateEndingBalance();
    }
  }

  @override
  void onInit() {
    super.onInit();
    amountController.addListener(() {
      updateAmount(amountController.text);
    });
    calculateEndingBalance();
  }

  @override
  void onClose() {
    amountController.dispose();
    noteController.dispose();
    super.onClose();
  }
}
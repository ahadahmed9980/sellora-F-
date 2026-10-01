import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sellora/models/salesHistoryModels.dart';
import 'package:sellora/utils/theme/app_colors.dart';

class SalesHistoryController extends GetxController {
  // Search controller
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;

  // Date filter state ('Today', 'Yesterday', 'This Week', 'This Month', 'All')
  final RxString selectedDateFilter = 'Today'.obs;
  final Rx<DateTime> selectedCustomDate = DateTime.now().obs;

  // Payment method filter state ('All', 'Cash', 'Credit', 'Card', 'Online')
  final RxString selectedPaymentFilter = 'All'.obs;

  // Selected sale record for receipt detail view
  final Rx<SaleRecord?> selectedSale = Rx<SaleRecord?>(null);

  // Month names for date display
  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  String get formattedSelectedDate {
    final date = selectedCustomDate.value;
    return "${date.day} ${_months[date.month - 1]} ${date.year}";
  }

  // Master sales records list
  final RxList<SaleRecord> allSales = <SaleRecord>[].obs;

  // Filtered sales records list
  final RxList<SaleRecord> filteredSales = <SaleRecord>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSampleSales();
    applyFilters();

    searchController.addListener(() {
      searchQuery.value = searchController.text.trim();
      applyFilters();
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  /// Load realistic sample sales data
  void _loadSampleSales() {
    final now = DateTime.now();

    allSales.assignAll([
      SaleRecord(
        id: '1',
        receiptNumber: 'INV-10293',
        dateTime: DateTime(now.year, now.month, now.day, 16, 32),
        customerName: 'Luna Boutique',
        customerPhone: '0300-8472910',
        registerName: 'Cash Register #1',
        cashierName: 'Sarah Ahmed',
        paymentMethod: 'Credit',
        subtotal: 14500,
        discount: 500,
        tax: 0,
        totalAmount: 14000,
        status: 'Completed',
        note: 'Credit sale invoice for autumn collection order',
        items: const [
          SaleItem(
            title: 'Silk Embroidered Kurti',
            quantity: 2,
            unitPrice: 4500,
            totalPrice: 9000,
          ),
          SaleItem(
            title: 'Chiffon Dupatta Luxury',
            quantity: 2,
            unitPrice: 2500,
            totalPrice: 5000,
          ),
          SaleItem(
            title: 'Cotton Trouser Slim Fit',
            quantity: 1,
            unitPrice: 1000,
            totalPrice: 1000,
          ),
        ],
      ),
      SaleRecord(
        id: '2',
        receiptNumber: 'INV-10292',
        dateTime: DateTime(now.year, now.month, now.day, 15, 45),
        customerName: 'Walk-in Customer',
        customerPhone: '0321-4567890',
        registerName: 'Cash Register #1',
        cashierName: 'Sarah Ahmed',
        paymentMethod: 'Cash',
        subtotal: 6200,
        discount: 200,
        tax: 0,
        totalAmount: 6000,
        status: 'Completed',
        note: 'Cash payment counter receipt',
        items: const [
          SaleItem(
            title: 'Denim Jacket Classic',
            quantity: 1,
            unitPrice: 4200,
            totalPrice: 4200,
          ),
          SaleItem(
            title: 'Cotton Graphic T-Shirt',
            quantity: 2,
            unitPrice: 1000,
            totalPrice: 2000,
          ),
        ],
      ),
      SaleRecord(
        id: '3',
        receiptNumber: 'INV-10291',
        dateTime: DateTime(now.year, now.month, now.day, 14, 10),
        customerName: 'Ahmed Malik',
        customerPhone: '0333-9123456',
        registerName: 'Cash Register #2',
        cashierName: 'Ali Raza',
        paymentMethod: 'Card',
        subtotal: 18500,
        discount: 0,
        tax: 0,
        totalAmount: 18500,
        status: 'Completed',
        note: 'POS Terminal HBL Visa *4921',
        items: const [
          SaleItem(
            title: 'Men 3-Piece Formal Suit',
            quantity: 1,
            unitPrice: 14500,
            totalPrice: 14500,
          ),
          SaleItem(
            title: 'Leather Belt Classic Black',
            quantity: 2,
            unitPrice: 2000,
            totalPrice: 4000,
          ),
        ],
      ),
      SaleRecord(
        id: '4',
        receiptNumber: 'INV-10290',
        dateTime: DateTime(now.year, now.month, now.day, 12, 20),
        customerName: 'Hamza Cloth House',
        customerPhone: '0312-7788990',
        registerName: 'Cash Register #1',
        cashierName: 'Sarah Ahmed',
        paymentMethod: 'Credit',
        subtotal: 28000,
        discount: 1000,
        tax: 0,
        totalAmount: 27000,
        status: 'Completed',
        note: 'Wholesale credit invoice account ledger #44',
        items: const [
          SaleItem(
            title: 'Unstitched Lawn Bundles',
            quantity: 4,
            unitPrice: 5500,
            totalPrice: 22000,
          ),
          SaleItem(
            title: 'Printed Khaddar Fabric',
            quantity: 2,
            unitPrice: 3000,
            totalPrice: 6000,
          ),
        ],
      ),
      SaleRecord(
        id: '5',
        receiptNumber: 'INV-10289',
        dateTime: DateTime(now.year, now.month, now.day, 11, 05),
        customerName: 'Walk-in Customer',
        customerPhone: null,
        registerName: 'Cash Register #1',
        cashierName: 'Sarah Ahmed',
        paymentMethod: 'Cash',
        subtotal: 3500,
        discount: 0,
        tax: 0,
        totalAmount: 3500,
        status: 'Completed',
        note: 'Exact cash given',
        items: const [
          SaleItem(
            title: 'Casual Polo Shirt Navy',
            quantity: 1,
            unitPrice: 2500,
            totalPrice: 2500,
          ),
          SaleItem(
            title: 'Cotton Socks Pair (Pack of 3)',
            quantity: 2,
            unitPrice: 500,
            totalPrice: 1000,
          ),
        ],
      ),
      SaleRecord(
        id: '6',
        receiptNumber: 'INV-10288',
        dateTime: DateTime(now.year, now.month, now.day, 10, 15),
        customerName: 'Zainab Fatima',
        customerPhone: '0302-3344556',
        registerName: 'Cash Register #2',
        cashierName: 'Ali Raza',
        paymentMethod: 'Online',
        subtotal: 9800,
        discount: 300,
        tax: 0,
        totalAmount: 9500,
        status: 'Completed',
        note: 'Nayapay QR payment verified',
        items: const [
          SaleItem(
            title: 'Handmade Leather Handbag',
            quantity: 1,
            unitPrice: 7500,
            totalPrice: 7500,
          ),
          SaleItem(
            title: 'Silk Scarf Floral Design',
            quantity: 1,
            unitPrice: 2300,
            totalPrice: 2300,
          ),
        ],
      ),
      SaleRecord(
        id: '7',
        receiptNumber: 'INV-10287',
        dateTime: DateTime(now.year, now.month, now.day - 1, 19, 40),
        customerName: 'Ayesha Collection',
        customerPhone: '0345-1239876',
        registerName: 'Cash Register #1',
        cashierName: 'Sarah Ahmed',
        paymentMethod: 'Credit',
        subtotal: 21000,
        discount: 1000,
        tax: 0,
        totalAmount: 20000,
        status: 'Completed',
        note: 'Credit account balance updated',
        items: const [
          SaleItem(
            title: 'Party Wear Velvet Maxi',
            quantity: 2,
            unitPrice: 9000,
            totalPrice: 18000,
          ),
          SaleItem(
            title: 'Embellished Clutch Gold',
            quantity: 1,
            unitPrice: 3000,
            totalPrice: 3000,
          ),
        ],
      ),
      SaleRecord(
        id: '8',
        receiptNumber: 'INV-10286',
        dateTime: DateTime(now.year, now.month, now.day - 1, 17, 15),
        customerName: 'Walk-in Customer',
        customerPhone: null,
        registerName: 'Cash Register #1',
        cashierName: 'Sarah Ahmed',
        paymentMethod: 'Cash',
        subtotal: 4800,
        discount: 0,
        tax: 0,
        totalAmount: 4800,
        status: 'Completed',
        note: 'Counter receipt',
        items: const [
          SaleItem(
            title: 'Chino Trousers Khaki',
            quantity: 2,
            unitPrice: 2400,
            totalPrice: 4800,
          ),
        ],
      ),
      SaleRecord(
        id: '9',
        receiptNumber: 'INV-10285',
        dateTime: DateTime(now.year, now.month, now.day - 2, 14, 50),
        customerName: 'Tariq Mehmood',
        customerPhone: '0301-7654321',
        registerName: 'Cash Register #1',
        cashierName: 'Sarah Ahmed',
        paymentMethod: 'Cash',
        subtotal: 12500,
        discount: 500,
        tax: 0,
        totalAmount: 12000,
        status: 'Completed',
        note: 'Cash sale register #1',
        items: const [
          SaleItem(
            title: 'Winter Wool Shawl',
            quantity: 2,
            unitPrice: 5000,
            totalPrice: 10000,
          ),
          SaleItem(
            title: 'Leather Wallet Brown',
            quantity: 1,
            unitPrice: 2500,
            totalPrice: 2500,
          ),
        ],
      ),
    ]);
  }

  /// Apply active filters (Date, Payment Type, Search Query)
  void applyFilters() {
    final query = searchQuery.value.toLowerCase();
    final dateFilter = selectedDateFilter.value;
    final paymentFilter = selectedPaymentFilter.value;
    final now = DateTime.now();

    final result =
        allSales.where((sale) {
          // 1. Search Query filter (matches receipt number, customer name, phone, or item name)
          if (query.isNotEmpty) {
            final matchReceipt = sale.receiptNumber.toLowerCase().contains(
              query,
            );
            final matchCustomer = sale.customerName.toLowerCase().contains(
              query,
            );
            final matchPhone = (sale.customerPhone ?? '').contains(query);
            final matchItems = sale.items.any(
              (item) => item.title.toLowerCase().contains(query),
            );

            if (!matchReceipt && !matchCustomer && !matchPhone && !matchItems) {
              return false;
            }
          }

          // 2. Date Filter
          if (dateFilter == 'Today') {
            final isToday =
                sale.dateTime.year == now.year &&
                sale.dateTime.month == now.month &&
                sale.dateTime.day == now.day;
            if (!isToday) return false;
          } else if (dateFilter == 'Yesterday') {
            final yesterday = now.subtract(const Duration(days: 1));
            final isYesterday =
                sale.dateTime.year == yesterday.year &&
                sale.dateTime.month == yesterday.month &&
                sale.dateTime.day == yesterday.day;
            if (!isYesterday) return false;
          } else if (dateFilter == 'This Week') {
            final weekAgo = now.subtract(const Duration(days: 7));
            if (sale.dateTime.isBefore(weekAgo)) return false;
          } else if (dateFilter == 'This Month') {
            final isThisMonth =
                sale.dateTime.year == now.year &&
                sale.dateTime.month == now.month;
            if (!isThisMonth) return false;
          } else if (dateFilter == 'Custom') {
            final custom = selectedCustomDate.value;
            final isCustomDate =
                sale.dateTime.year == custom.year &&
                sale.dateTime.month == custom.month &&
                sale.dateTime.day == custom.day;
            if (!isCustomDate) return false;
          }

          // 3. Payment Method Filter (All, Cash, Credit, Card, Online)
          if (paymentFilter != 'All') {
            if (paymentFilter == 'Online / Card') {
              if (sale.paymentMethod != 'Card' &&
                  sale.paymentMethod != 'Online') {
                return false;
              }
            } else if (sale.paymentMethod != paymentFilter) {
              return false;
            }
          }

          return true;
        }).toList();

    filteredSales.assignAll(result);
  }

  /// Change date filter tab
  void setDateFilter(String filter) {
    selectedDateFilter.value = filter;
    applyFilters();
  }

  /// Change payment method filter tab
  void setPaymentFilter(String filter) {
    selectedPaymentFilter.value = filter;
    applyFilters();
  }

  /// Pick custom date
  Future<void> pickCustomDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCustomDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) {
      selectedCustomDate.value = picked;
      selectedDateFilter.value = 'Custom';
      applyFilters();
    }
  }

  /// Clear search bar
  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
    applyFilters();
  }

  /// Select a sale for viewing details
  void selectSale(SaleRecord sale) {
    selectedSale.value = sale;
  }

  // --- Summary Metrics Getters ---

  int get totalSalesCount => filteredSales.length;

  double get totalRevenue =>
      filteredSales.fold(0.0, (sum, item) => sum + item.totalAmount);

  double get totalCashRevenue => filteredSales
      .where((s) => s.paymentMethod == 'Cash')
      .fold(0.0, (sum, item) => sum + item.totalAmount);

  double get totalCreditRevenue => filteredSales
      .where((s) => s.paymentMethod == 'Credit')
      .fold(0.0, (sum, item) => sum + item.totalAmount);

  double get totalDigitalRevenue => filteredSales
      .where((s) => s.paymentMethod == 'Card' || s.paymentMethod == 'Online')
      .fold(0.0, (sum, item) => sum + item.totalAmount);

  String formatCurrency(double amount) {
    final formatted = amount.toStringAsFixed(0);
    return formatted.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  String get totalRevenueFormatted => formatCurrency(totalRevenue);
  String get totalCashFormatted => formatCurrency(totalCashRevenue);
  String get totalCreditFormatted => formatCurrency(totalCreditRevenue);
  String get totalDigitalFormatted => formatCurrency(totalDigitalRevenue);

  // --- Actions ---

  void copyReceiptNumber(String receiptNo) {
    Clipboard.setData(ClipboardData(text: receiptNo));
    Get.snackbar(
      "Copied to Clipboard",
      "Receipt #$receiptNo copied successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 14,
      duration: const Duration(seconds: 2),
    );
  }

  void downloadPdf(SaleRecord sale) {
    Get.snackbar(
      "PDF Downloaded",
      "Receipt #${sale.receiptNumber} invoice saved to downloads.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFF59E0B),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 14,
      icon: const Icon(Icons.picture_as_pdf_rounded, color: Colors.white),
      duration: const Duration(seconds: 2),
    );
  }

  void shareReceipt(SaleRecord sale) {
    Get.snackbar(
      "Share Receipt",
      "Opening share options for #${sale.receiptNumber}...",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 14,
      duration: const Duration(seconds: 2),
    );
  }

  void printReceipt(SaleRecord sale) {
    Get.snackbar(
      "Print Receipt",
      "Sending #${sale.receiptNumber} to Thermal Printer...",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.textPrimary,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 14,
      icon: const Icon(Icons.print_rounded, color: Colors.white),
      duration: const Duration(seconds: 2),
    );
  }
}
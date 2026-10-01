/// Item in a sale transaction
class SaleItem {
  final String title;
  final int quantity;
  final double unitPrice;
  final double totalPrice;

  const SaleItem({
    required this.title,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
  });
}

/// Sale transaction model
class SaleRecord {
  final String id;
  final String receiptNumber;
  final DateTime dateTime;
  final String customerName;
  final String? customerPhone;
  final String registerName;
  final String cashierName;
  final String paymentMethod; // 'Cash', 'Credit', 'Card', 'Online'
  final List<SaleItem> items;
  final double subtotal;
  final double discount;
  final double tax;
  final double totalAmount;
  final String status; // 'Completed', 'Credit / Due', 'Refunded'
  final String note;

  const SaleRecord({
    required this.id,
    required this.receiptNumber,
    required this.dateTime,
    required this.customerName,
    this.customerPhone,
    required this.registerName,
    required this.cashierName,
    required this.paymentMethod,
    required this.items,
    required this.subtotal,
    this.discount = 0.0,
    this.tax = 0.0,
    required this.totalAmount,
    this.status = 'Completed',
    this.note = '',
  });

  String get formattedTime {
    final hour = dateTime.hour > 12
        ? dateTime.hour - 12
        : (dateTime.hour == 0 ? 12 : dateTime.hour);
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  String get formattedDateTime {
    final months = [
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
    final now = DateTime.now();
    final isToday =
        dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
    final isYesterday =
        dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day - 1;

    final datePrefix = isToday
        ? 'Today'
        : isYesterday
        ? 'Yesterday'
        : '${dateTime.day} ${months[dateTime.month - 1]} ${dateTime.year}';

    return '$datePrefix, $formattedTime';
  }

  String get totalAmountFormatted {
    final formatted = totalAmount.toStringAsFixed(0);
    return formatted.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}

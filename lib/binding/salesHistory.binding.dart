import 'package:get/get.dart';
import 'package:sellora/controller/salesHistory.controller.dart';
class SalesHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesHistoryController>(() =>SalesHistoryController());
  }
}

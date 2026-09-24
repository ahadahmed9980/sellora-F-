import 'package:get/get.dart';
import 'package:sellora/controller/addExpense.controller.dart';
class Addexpensebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Addexpensecontroller>(() => Addexpensecontroller());
  }
}

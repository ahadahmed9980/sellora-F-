import 'package:get/get.dart';
import 'package:sellora/controller/newSale.controller.dart';
class Newsalebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Newsalecontroller>(() =>Newsalecontroller());
  }
}

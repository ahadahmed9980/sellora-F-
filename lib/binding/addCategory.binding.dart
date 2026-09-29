import 'package:get/get.dart';
import 'package:sellora/controller/addCategory.controller.dart';
class Addcategorybinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Addcategorycontroller>(() => Addcategorycontroller());
  }
}

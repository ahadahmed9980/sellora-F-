import 'package:get/get.dart';
import 'package:sellora/controller/addProduct.controller.dart';

class AddProductbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Addproductcontroller>(() => Addproductcontroller());
  }
}

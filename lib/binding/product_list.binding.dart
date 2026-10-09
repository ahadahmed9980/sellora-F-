import 'package:get/get.dart';
import 'package:sellora/controller/product_list.controller.dart';
class ProductListbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Productlistcontroller>(() =>Productlistcontroller());
  }
}

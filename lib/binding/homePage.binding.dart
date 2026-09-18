import 'package:get/get.dart';
import 'package:sellora/controller/homePage.controller.dart';

class Homepagebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Homepagecontroller>(() => Homepagecontroller());
  }
}

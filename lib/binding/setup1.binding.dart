import 'package:get/get.dart';
import 'package:sellora/controller/setup1.controller.dart';

class Setup1binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Setup1controller>(() => Setup1controller());
  }
}

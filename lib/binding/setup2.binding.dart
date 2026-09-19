import 'package:get/get.dart';
import 'package:sellora/controller/setup2.controller.dart';

class Setup2binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Setup2controller>(() => Setup2controller());
  }
}

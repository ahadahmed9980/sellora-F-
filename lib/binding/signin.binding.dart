import 'package:get/get.dart';
import 'package:sellora/controller/signin.controller.dart';

class Signinbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Signincontroller>(() => Signincontroller());
  }
}

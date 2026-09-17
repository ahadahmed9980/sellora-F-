import 'package:get/get.dart';
import 'package:sellora/controller/signup.controller.dart';

class Signupbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Signupcontroller>(() => Signupcontroller());
  }
}
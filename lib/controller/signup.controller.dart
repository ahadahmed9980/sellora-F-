import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  final RxBool agreeToTerms = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void toggleTerms([bool? value]) {
    if (value != null) {
      agreeToTerms.value = value;
    } else {
      agreeToTerms.value = !agreeToTerms.value;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

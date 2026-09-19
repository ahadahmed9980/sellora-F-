import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Setup1controller extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final RxString selectedCountryCode = '+92'.obs;
  final List<String> countryCodes = const ['+92', '+1', '+44', '+971', '+966'];

  void updateCountryCode(String code) {
    selectedCountryCode.value = code;
  }

  var selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickimageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      // .value ko nayi value assign karne se UI update ho jayegi
      selectedImage.value = File(pickedFile.path);
    }
  }

  void onContinue() {
    // Placeholder for step 1 submission / navigation
    debugPrint("Continue tapped");
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.onClose();
  }
}

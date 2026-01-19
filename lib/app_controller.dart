import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AppController extends GetxController {
  // قائمة الأسماء
  var students = <String>["Neamah", "Eleen"].obs;
  final nameController = TextEditingController();

  // تسجيل الدخول
  final userController = TextEditingController();
  final passController = TextEditingController();

  // الصورة والصوت
  var imagePath = "".obs;
  var currentVolume = 0.5.obs;
  final ImagePicker _picker = ImagePicker();

  void login() {
    if (userController.text == "admin" && passController.text == "123456") {
      Get.offNamed('/menu');
    } else {
      Get.snackbar(
        "Error", "login_error".tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) imagePath.value = pickedFile.path;
  }

  void addStudent() {
    if (nameController.text.isNotEmpty) {
      students.add(nameController.text);
      nameController.clear();
    }
  }

  void removeStudent(int index) => students.removeAt(index);

  void editStudent(int index) {
    nameController.text = students[index];
    students.removeAt(index);
  }

  void toggleLanguage() {
    var locale = Get.locale?.languageCode == 'ar' ? const Locale('en') : const Locale('ar');
    Get.updateLocale(locale);
  }
}
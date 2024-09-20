import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toaster {
  static error(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.redAccent, colorText: Colors.white);
  }

  static normal(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.blueAccent, colorText: Colors.white);
  }

  static success(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.green, colorText: Colors.white);
  }
}

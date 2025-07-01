import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void success(String message, {String title = "Success"}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: Icon(Icons.check_circle, color: Colors.white),
    );
  }

  static void error(String message, {String title = "Error"}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: Icon(Icons.error, color: Colors.white),
    );
  }

  static void loading({String message = "Loading..."}) {
    Get.snackbar(
      "",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blueGrey,
      colorText: Colors.white,
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.white54,
    );
  }

  static void info(String message, {String title = "Info"}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      icon: Icon(Icons.info, color: Colors.white),
    );
  }

  static void dismiss() {
    if (Get.isSnackbarOpen) Get.back();
  }
}

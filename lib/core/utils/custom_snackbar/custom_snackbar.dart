import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../error/failures.dart';
import '../../error/message_failure.dart';

class CustomSnackBar {
  static SnackbarController failureSnackBar(Failure? failure) {
    return Get.rawSnackbar(
      backgroundColor: Get.theme.colorScheme.error,
      snackPosition: SnackPosition.TOP,
      borderRadius: 50.0,
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      messageText: Text(
        MessageFailure.message(failure),
        style: Get.textTheme.displayMedium,
      ),
    );
  }
}

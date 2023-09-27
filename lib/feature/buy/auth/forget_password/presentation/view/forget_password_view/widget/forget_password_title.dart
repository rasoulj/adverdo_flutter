import 'package:advedro/config/language/language_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordTitle extends StatelessWidget {
  const ForgetPasswordTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LanguageKeys.forgetPassword.tr,
      style: Get.textTheme.headlineLarge,
    );
  }
}

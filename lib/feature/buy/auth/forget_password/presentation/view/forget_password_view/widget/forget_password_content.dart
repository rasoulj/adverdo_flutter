import 'package:advedro/config/dimension/dimension.dart';
import 'package:advedro/config/language/language_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordContent extends StatelessWidget {
  const ForgetPasswordContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.width(context) - 60.0,
      child: Text(
        LanguageKeys.forgetPasswordContent.tr,
        style: Get.textTheme.bodyMedium?.copyWith(height: 1.6),
      ),
    );
  }
}

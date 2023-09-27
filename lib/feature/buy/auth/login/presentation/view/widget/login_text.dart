import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/language/language_key.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 31.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          LanguageKeys.login.tr,
          style: Get.textTheme.headlineLarge,
        ),
      ),
    );
  }
}

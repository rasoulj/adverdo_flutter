import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../config/language/language_key.dart';

class SignUpYouAlreadyHaveAnAccount extends StatelessWidget {
  const SignUpYouAlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 31.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: LanguageKeys.alreadyYouHaveAnAccount.tr,
                style: Get.textTheme.titleSmall?.copyWith(color: Get.theme.colorScheme.onPrimary),
              ),
              TextSpan(
                text: " ${LanguageKeys.login.tr}",
                style: Get.textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

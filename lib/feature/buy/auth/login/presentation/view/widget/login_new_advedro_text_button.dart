import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/dimension/dimension.dart';
import '../../../../../../../config/language/language_key.dart';

class LoginNewAdvedroTextButton extends StatelessWidget {
  const LoginNewAdvedroTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0),
      width: Dimensions.width(context),
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          style: Get.textTheme.titleSmall?.copyWith(color: Get.theme.primaryColor),
          text: LanguageKeys.newToAdvedro.tr,
          children: [
            TextSpan(
              text: " ${LanguageKeys.signUp.tr}",
              style: Get.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}

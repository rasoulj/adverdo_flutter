import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/dimension/dimension.dart';
import '../../../../../../../config/language/language_key.dart';

class LoginForgetPasswordTextButton extends StatelessWidget {
  const LoginForgetPasswordTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0),
      width: Dimensions.width(context),
      alignment: Alignment.topLeft,
      child: Text(
        LanguageKeys.forgotPassword.tr,
        style: Get.textTheme.titleSmall,
      ),
    );
  }
}

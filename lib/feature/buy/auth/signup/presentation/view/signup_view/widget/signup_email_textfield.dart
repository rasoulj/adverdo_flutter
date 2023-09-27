import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../common/custom_textfield/custom_textfield.dart';
import '../../../../../../../../config/asset_resource/asset_resource_icons.dart';
import '../../../../../../../../config/language/language_key.dart';
import '../../../controller/signup_controller.dart';

class SignUpEmailTextField extends GetView<SignUpController> {
  const SignUpEmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextField(
        labelText: LanguageKeys.emailWithStar.tr,
        controller: controller.emailController,
        errorText: controller.emailErrorText.value,
        suffixIcon: controller.isValidateEmail.value
            ? SizedBox(
                height: 9,
                width: 14.0,
                child: Icon(AssetResource.check, color: Get.theme.primaryColorDark),
              )
            : null,
        onChanged: (String value) {
          controller.emailOnChangeValidator(
            value: value,
            isValidateEmail: controller.isValidateEmail,
            emailErrorText: controller.emailErrorText,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/asset_resource/asset_resource_icons.dart';
import '../../../../../../../config/language/language_key.dart';
import '../../../../../../../common/custom_textfield/custom_textfield.dart';
import '../../controller/login_controller.dart';

class LoginEmailTextField extends GetView<LoginController> {
  const LoginEmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextField(
        controller: controller.emailAddressController,
        labelText: LanguageKeys.emailAddress.tr,
        errorText: controller.emailTextError.value,
        suffixIcon: controller.isValidateEmail.value
            ? SizedBox(
                height: 9,
                width: 14.0,
                child: Icon(
                  AssetResource.check,
                  color: Get.theme.primaryColorDark,
                ),
              )
            : null,
        onChanged: (String value) => controller.isEmail(
          value: value,
          isValidEmail: controller.isValidateEmail,
        ),
      ),
    );
  }
}

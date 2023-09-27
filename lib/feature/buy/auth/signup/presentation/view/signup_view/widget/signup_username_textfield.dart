import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../common/custom_textfield/custom_textfield.dart';
import '../../../../../../../../config/asset_resource/asset_resource_icons.dart';
import '../../../../../../../../config/language/language_key.dart';
import '../../../controller/signup_controller.dart';

class SignUpUserNameTextField extends GetView<SignUpController> {
  const SignUpUserNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextField(
        labelText: LanguageKeys.userNameWithStar.tr,
        controller: controller.userNameController,
        errorText: controller.userNameErrorText.value,
        suffixIcon: controller.isValidateUserName.value
            ? SizedBox(
                height: 9,
                width: 14.0,
                child: Icon(AssetResource.check, color: Get.theme.primaryColorDark),
              )
            : null,
        onChanged: (String value) => controller.userNameOnChangeValidator(
          value: value,
          isValidateUserName: controller.isValidateUserName,
          userNameErrorText: controller.userNameErrorText,
        ),
      ),
    );
  }
}

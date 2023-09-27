import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../common/custom_textfield/custom_textfield.dart';
import '../../../../../../../../config/asset_resource/asset_resource_icons.dart';
import '../../../../../../../../config/language/language_key.dart';
import '../../../controller/signup_controller.dart';

class SignUpLastNameTextField extends GetView<SignUpController> {
  const SignUpLastNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextField(
        labelText: LanguageKeys.lastNameWithStar.tr,
        controller: controller.lastNameController,
        errorText: controller.lastNameErrorText.value,
        suffixIcon: controller.isValidateLastName.value
            ? SizedBox(
                height: 9,
                width: 14.0,
                child: Icon(AssetResource.check, color: Get.theme.primaryColorDark),
              )
            : null,
        onChanged: (String value) => controller.lastNameOnChangeValidator(
          value: value,
          isValidateLastName: controller.isValidateLastName,
          lastNameErrorText: controller.lastNameErrorText,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../common/custom_textfield/custom_textfield.dart';
import '../../../../../../../../config/asset_resource/asset_resource_icons.dart';
import '../../../../../../../../config/language/language_key.dart';
import '../../../controller/signup_controller.dart';

class SignUpFirstNameTextField extends GetView<SignUpController> {
  const SignUpFirstNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextField(
        labelText: LanguageKeys.firstNameWithStar.tr,
        controller: controller.firstNameController,
        errorText: controller.firstNameErrorText.value,
        suffixIcon: controller.isValidateFirstName.value
            ? SizedBox(
                height: 9,
                width: 14.0,
                child: Icon(AssetResource.check, color: Get.theme.primaryColorDark),
              )
            : null,
        onChanged: (String value) => controller.firstNameOnChangeValidator(
          value: value,
          isValidateFirstName: controller.isValidateFirstName,
          firstNameErrorText: controller.firstNameErrorText,
        ),
      ),
    );
  }
}

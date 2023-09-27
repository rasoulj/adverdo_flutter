import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../config/asset_resource/asset_resource_icons.dart';
import '../../../../../../../config/language/language_key.dart';
import '../../../../../../../common/custom_textfield/custom_textfield.dart';
import '../../controller/login_controller.dart';

class PasswordTextField extends GetView<LoginController> {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextField(
        controller: controller.passwordController,
        labelText: LanguageKeys.password.tr,
        obscureText: controller.obscurePasswordText.value,
        errorText: controller.passwordTextError.value,
        suffixOnTap: () => controller.obscurePasswordText.value = !controller.obscurePasswordText.value,
        suffixIcon: Icon(
          controller.obscurePasswordText.value ? AssetResource.showEye : AssetResource.hide,
          color: Get.theme.primaryColor,
          size: 20.0,
        ),
        onChanged: (String value) {},
      ),
    );
  }
}

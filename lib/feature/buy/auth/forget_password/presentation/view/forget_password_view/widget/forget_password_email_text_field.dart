import 'package:advedro/config/asset_resource/asset_resource_icons.dart';
import 'package:advedro/config/language/language_key.dart';
import 'package:advedro/feature/buy/auth/forget_password/presentation/controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../common/custom_textfield/custom_textfield.dart';
import '../../../../../../../../config/dimension/dimension.dart';

class ForgetPasswordEmailTextField extends GetView<ForgetPasswordController> {
  const ForgetPasswordEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: Dimensions.width(context) - 60.0,
        child: CustomTextField(
          labelText: LanguageKeys.emailAddress.tr,
          controller: controller.emailController,
          padding: EdgeInsets.zero,
          errorText: controller.emailTextError.value,
          onChanged: (String value) => controller.emailValidator(value),
          suffixIcon: SizedBox(
            height: 14.0,
            width: 9.0,
            child: controller.showValidEmailIcon.value
                ? Icon(
                    AssetResource.check,
                    color: Get.theme.primaryColorDark,
                    size: 20,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

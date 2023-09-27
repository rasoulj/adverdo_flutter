import 'package:advedro/config/language/language_key.dart';
import 'package:advedro/config/routes_management/buy_routes_management/buy_routes.dart';
import 'package:advedro/feature/buy/auth/forget_password/presentation/controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../common/custom_filled_button/custom_filled_button.dart';
import '../../../../../../../config/dimension/dimension.dart';
import '../../../../../../../core/utils/custom_gradient/custom_gradient.dart';
import 'widget/forget_password_content.dart';
import 'widget/forget_password_email_text_field.dart';
import 'widget/forget_password_image_background.dart';
import 'widget/forget_password_logo.dart';
import 'widget/forget_password_remember_your_password.dart';
import 'widget/forget_password_title.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Dimensions.height(context),
          width: Dimensions.width(context),
          decoration: BoxDecoration(gradient: CustomGradient.authGradient),
          child: Stack(
            children: [
              const ForgetPasswordImageBackground(),
              const ForgetPasswordLogo(),
              Positioned(
                top: 330.0,
                left: 31.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ForgetPasswordTitle(),
                    const SizedBox(height: 14.0),
                    const ForgetPasswordContent(),
                    const SizedBox(height: 23.0),
                    const ForgetPasswordRememberYourPasswordOrLogin(),
                    const SizedBox(height: 43.0),
                    const ForgetPasswordEmailTextField(),
                    const SizedBox(height: 58.0),
                    CustomFilledButton(
                      onPressed: () {
                        String email = controller.emailController.value.text.trim();
                        if (controller.emailValidator(email)) Get.toNamed(BuyRoutes.goToLogin);
                      },
                      title: LanguageKeys.resetPassword.tr,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

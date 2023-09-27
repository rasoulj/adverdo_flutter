import 'package:advedro/common/custom_filled_button/custom_filled_button.dart';
import 'package:advedro/config/dimension/dimension.dart';
import 'package:advedro/config/routes_management/buy_routes_management/buy_routes.dart';
import 'package:advedro/core/utils/custom_gradient/custom_gradient.dart';
import 'package:advedro/feature/buy/auth/forget_password/presentation/controller/forget_password_controller.dart';
import 'package:advedro/feature/buy/auth/forget_password/presentation/view/forget_password_view/widget/forget_password_image_background.dart';
import 'package:advedro/feature/buy/auth/forget_password/presentation/view/forget_password_view/widget/forget_password_logo.dart';
import 'package:advedro/feature/buy/auth/forget_password/presentation/view/forget_password_view/widget/forget_password_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/language/language_key.dart';

class ForgetPasswordGoToLoginView extends GetView<ForgetPasswordController> {
  const ForgetPasswordGoToLoginView({super.key});

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
                top: 331.0,
                left: 31.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ForgetPasswordTitle(),
                    const SizedBox(height: 14.0),
                    SizedBox(
                      width: Dimensions.width(context) - 60.0,
                      child: RichText(
                        text: TextSpan(
                          text: LanguageKeys.forgetPasswordContentAfterSendCodeToEmail.tr,
                          style: Get.textTheme.bodyMedium?.copyWith(height: 1.6),
                          children: [
                            TextSpan(
                              text: controller.emailController.value.text.trim(),
                              style: Get.textTheme.bodyMedium?.copyWith(height: 1.6, fontWeight: FontWeight.w700),
                            ),
                            const TextSpan(text: " "),
                            TextSpan(
                              text: LanguageKeys.forgetPasswordContentAfterSendCodeToEmailLine2.tr,
                              style: Get.textTheme.bodyMedium?.copyWith(height: 1.6),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 139.0),
                    CustomFilledButton(
                      onPressed: () => Get.offAllNamed(BuyRoutes.login),
                      title: LanguageKeys.goToLogin,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

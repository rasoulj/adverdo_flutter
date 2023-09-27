import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../common/custom_filled_button/custom_filled_button.dart';
import '../../../../../../../config/dimension/dimension.dart';
import '../../../../../../../config/language/language_key.dart';
import '../../../../../../../core/utils/custom_gradient/custom_gradient.dart';
import '../../controller/signup_controller.dart';
import 'widget/signup_widget.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

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
              const SignUpImageBackground(),
              const SignUpLogo(),
              Padding(
                padding: const EdgeInsets.only(top: 318.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SignUpText(),
                      const SizedBox(height: 17.0),
                      const SignUpYouAlreadyHaveAnAccount(),
                      const SizedBox(height: 17.0),
                      const SignUpUserNameTextField(),
                      const SizedBox(height: 26.0),
                      const SignUpFirstNameTextField(),
                      const SizedBox(height: 26.0),
                      const SignUpLastNameTextField(),
                      const SizedBox(height: 26.0),
                      const SignUpEmailTextField(),
                      const SizedBox(height: 34.0),
                      CustomFilledButton(onPressed: () => controller.signUp(), title: LanguageKeys.signUp.tr),
                      const SizedBox(height: kToolbarHeight),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/custom_filled_button/custom_filled_button.dart';
import '../../../../../../config/dimension/dimension.dart';
import '../../../../../../config/language/language_key.dart';
import '../../../../../../core/utils/custom_gradient/custom_gradient.dart';
import '../controller/login_controller.dart';
import 'widget/login_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
              const LoginImageBackground(),
              const LoginLogo(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const LoginText(),
                  const SizedBox(height: 35.0),
                  const LoginEmailTextField(),
                  const SizedBox(height: 26.0),
                  const PasswordTextField(),
                  const SizedBox(height: 26.0),
                  const LoginForgetPasswordTextButton(),
                  const SizedBox(height: 16.0),
                  const LoginNewAdvedroTextButton(),
                  const SizedBox(height: 108.0),
                  CustomFilledButton(onPressed: () => controller.login(), title: LanguageKeys.login.tr),
                  const SizedBox(height: kToolbarHeight),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

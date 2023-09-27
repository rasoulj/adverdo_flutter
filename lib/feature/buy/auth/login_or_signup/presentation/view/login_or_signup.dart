import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/custom_outline_button/custom_outline_button.dart';
import '../../../../../../config/asset_resource/images_resource.dart';
import '../../../../../../config/dimension/dimension.dart';
import '../../../../../../config/language/language_key.dart';
import '../../../../../../config/routes_management/buy_routes_management/buy_routes.dart';
import '../../../../../../core/utils/custom_gradient/custom_gradient.dart';
import '../../../../../../common/custom_filled_button/custom_filled_button.dart';

class LoginOrSignUpView extends GetView {
  const LoginOrSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Dimensions.height(context),
        width: Dimensions.width(context),
        decoration: BoxDecoration(gradient: CustomGradient.authGradient),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                ImagesResource.advedroBackground,
                height: 501.0,
                width: Dimensions.width(context),
                alignment: Alignment.topRight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 52.0, left: 31.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  ImagesResource.advedroLogo,
                  height: 77.0,
                  width: 71.0,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.width(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomFilledButton(
                    onPressed: () => Get.toNamed(BuyRoutes.login),
                    title: LanguageKeys.login.tr,
                  ),
                  const SizedBox(height: 28.0),
                  CustomOutlineButton(
                    onPressed: () => Get.toNamed(BuyRoutes.signUp),
                    title: LanguageKeys.signUp.tr,
                  ),
                  const SizedBox(height: kToolbarHeight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../config/language/language_key.dart';
import '../../../../../../../../config/routes_management/buy_routes_management/buy_routes.dart';

class ForgetPasswordRememberYourPasswordOrLogin extends StatelessWidget {
  const ForgetPasswordRememberYourPasswordOrLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LanguageKeys.rememberedYourPassword.tr,
          style: Get.textTheme.bodySmall,
        ),
        InkWell(
          onTap: () => Get.toNamed(BuyRoutes.login),
          child: Text(
            " ${LanguageKeys.login.tr}",
            style: Get.textTheme.bodySmall?.copyWith(color: Get.theme.primaryColorDark),
          ),
        ),
      ],
    );
  }
}

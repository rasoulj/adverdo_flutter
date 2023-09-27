import 'package:advedro/config/asset_resource/asset_resource_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../common/custom_disable_button/custom_disable_button.dart';
import '../../../../../../../common/custom_filled_button/custom_filled_button.dart';
import '../../../../../../../config/asset_resource/images_resource.dart';
import '../../../../../../../config/dimension/dimension.dart';
import '../../../../../../../config/language/language_key.dart';
import '../../../../../../../core/utils/custom_gradient/custom_gradient.dart';
import '../../controller/verification_controller.dart';
import 'widget/verification_fields.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Dimensions.height(context),
          width: Dimensions.width(context),
          decoration: BoxDecoration(gradient: CustomGradient.authGradient),
          child: Column(
            children: [
              const SizedBox(height: 102.0),
              Image.asset(
                ImagesResource.otp,
                height: 300.0,
                width: Dimensions.width(context) - (152),
              ),
              Text(
                LanguageKeys.otpVerification.tr,
                style: Get.textTheme.headlineMedium,
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                width: 276.0,
                height: 67.0,
                child: Column(
                  children: [
                    const VerificationFields(),
                    const SizedBox(height: 5),
                    Obx(
                      () => Visibility(
                        visible: controller.verificationTextError.value == null,
                        replacement: SizedBox(
                          height: 13.0,
                          width: Dimensions.width(context),
                          child: Text(
                            LanguageKeys.verificationError.tr,
                            style: Get.textTheme.labelSmall,
                          ),
                        ),
                        child: const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 276.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Icon(
                        AssetResource.timer,
                        size: 20,
                        color: Get.theme.colorScheme.onSecondary,
                      ),
                    ),
                    const SizedBox(width: 6.67),
                    Obx(
                      () => Text(
                        controller.countDownTimerValue.value,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.bodySmall?.copyWith(color: Get.theme.colorScheme.onSecondary),
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () => InkWell(
                        onTap: controller.enableResendButton.value ? () => controller.resendCode() : () {},
                        child: Text(
                          LanguageKeys.resendOTP.tr,
                          textAlign: TextAlign.center,
                          style: controller.enableResendButton.value
                              ? Get.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500)
                              : Get.textTheme.titleSmall?.copyWith(
                                  color: Get.theme.colorScheme.onSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100.0),
              Obx(
                () => Visibility(
                  visible: controller.isDisableButton.value,
                  replacement: CustomFilledButton(onPressed: () {}, title: LanguageKeys.verify.tr),
                  child: CustomDisableButton(title: LanguageKeys.verify.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

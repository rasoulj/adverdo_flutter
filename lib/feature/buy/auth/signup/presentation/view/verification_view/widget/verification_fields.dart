import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/verification_controller.dart';
import 'otp_textfield.dart';

class VerificationFields extends GetView<VerificationController> {
  const VerificationFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 276.0,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OtpTextField(
              textEditingController: controller.otp1Controller,
              focusNode: controller.focusNode1,
              errorText: controller.verificationTextError.value,
              onChanged: (String value) => controller.onFocusNodeChange(
                focusNode: controller.focusNode1,
                textEditingController: controller.otp1Controller,
              ),
            ),
            const SizedBox(width: 12.0),
            OtpTextField(
              textEditingController: controller.otp2Controller,
              focusNode: controller.focusNode2,
              errorText: controller.verificationTextError.value,
              onChanged: (String value) => controller.onFocusNodeChange(
                focusNode: controller.focusNode2,
                textEditingController: controller.otp2Controller,
              ),
            ),
            const SizedBox(width: 12.0),
            OtpTextField(
              textEditingController: controller.otp3Controller,
              focusNode: controller.focusNode3,
              errorText: controller.verificationTextError.value,
              onChanged: (String value) => controller.onFocusNodeChange(
                focusNode: controller.focusNode3,
                textEditingController: controller.otp3Controller,
              ),
            ),
            const SizedBox(width: 12.0),
            OtpTextField(
              textEditingController: controller.otp4Controller,
              focusNode: controller.focusNode4,
              errorText: controller.verificationTextError.value,
              onChanged: (String value) => controller.onFocusNodeChange(
                focusNode: controller.focusNode4,
                textEditingController: controller.otp4Controller,
              ),
            ),
            const SizedBox(width: 12.0),
            OtpTextField(
              textEditingController: controller.otp5Controller,
              focusNode: controller.focusNode5,
              errorText: controller.verificationTextError.value,
              onChanged: (String value) => controller.onFocusNodeChange(
                focusNode: controller.focusNode5,
                textEditingController: controller.otp5Controller,
              ),
            ),
            const SizedBox(width: 12.0),
            OtpTextField(
              textEditingController: controller.otp6Controller,
              focusNode: controller.focusNode6,
              errorText: controller.verificationTextError.value,
              onChanged: (String value) => controller.onFocusNodeChange(
                focusNode: controller.focusNode6,
                textEditingController: controller.otp6Controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:advedro/config/count_down_timer/count_down_timer.dart';
import 'package:advedro/feature/buy/auth/signup/domain/usecase/resend_verification_code_usecase.dart';
import 'package:advedro/feature/buy/auth/signup/presentation/variable/verification_variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/request/verification_request.dart';
import '../../domain/usecase/get_verification_code_usecase.dart';

class VerificationController extends GetxController with VerificationVariable, CountDownTimer {
  // constructor
  VerificationController({
    required this.resendVerificationCodeUseCase,
    required this.getVerificationCodeUseCase,
  });
  // usecase
  final GetVerificationCodeUseCase getVerificationCodeUseCase;
  final ResendVerificationCodeUseCase resendVerificationCodeUseCase;
  RxnString verificationTextError = RxnString();
  RxBool isDisableButton = RxBool(true);

  void getVerificationCode() async {
    var request = VerificationRequest(code: "102030", deviceInfo: {}, remember: "always");
    var result = await getVerificationCodeUseCase(request: request);
    result.fold(
      (failure) => null,
      (data) => null,
    );
  }

  void resendCode() async {
    startCountDownTimer();
    var request = VerificationRequest(code: "102030", deviceInfo: {}, remember: "always");
    var result = await resendVerificationCodeUseCase(request: request);
    result.fold(
      (failure) => null,
      (data) => null,
    );
  }

  void onFocusNodeChange({required FocusNode focusNode, required TextEditingController textEditingController}) {
    var value = textEditingController.value.text.trim();
    if (value.isNotEmpty && value.length == 1) {
      focusNode.nextFocus();
    } else if (value.length > 1) {
      textEditingController.clear();
      textEditingController.text = value[1];
      focusNode.nextFocus();
    }
    changeStateVerifyButton();
  }

  void changeStateVerifyButton() {
    String otp1 = otp1Controller.value.text.trim();
    String otp2 = otp2Controller.value.text.trim();
    String otp3 = otp3Controller.value.text.trim();
    String otp4 = otp4Controller.value.text.trim();
    String otp5 = otp5Controller.value.text.trim();
    String otp6 = otp6Controller.value.text.trim();
    if (otp1.isEmpty || otp2.isEmpty || otp3.isEmpty || otp4.isEmpty || otp5.isEmpty || otp6.isEmpty) {
      isDisableButton.value = true;
    } else {
      isDisableButton.value = false;
    }
  }

  @override
  void onInit() {
    startCountDownTimer();
    getVerificationCode();
    super.onInit();
  }

  @override
  void dispose() {
    disposeEditControllersAndFocusNodes();
    super.dispose();
  }
}

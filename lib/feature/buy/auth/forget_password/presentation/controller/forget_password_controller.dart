import 'package:advedro/config/language/language_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/request/forget_password_request.dart';
import '../../domain/usecase/forget_password_send_email_usecase.dart';

class ForgetPasswordController extends GetxController {
  ForgetPasswordController({required this.forgetPasswordUseCase});
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final TextEditingController emailController = TextEditingController();
  RxnString emailTextError = RxnString();
  RxBool showValidEmailIcon = RxBool(false);

  void sendEmail() async {
    String email = emailController.value.text.trim();
    ForgetPasswordRequest request = ForgetPasswordRequest(email: email);
    var result = await forgetPasswordUseCase(request: request);
    result.fold(
      (failure) => null,
      (data) => null,
    );
  }

  bool emailValidator(String value) {
    if (value.isEmail) {
      emailTextError.value = null;
      showValidEmailIcon.value = true;
      return true;
    } else {
      emailTextError.value = LanguageKeys.emailTextError.tr;
      showValidEmailIcon.value = false;
      return false;
    }
  }
}

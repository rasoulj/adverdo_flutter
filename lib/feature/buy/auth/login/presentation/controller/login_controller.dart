import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/utils/custom_snackbar/custom_snackbar.dart';
import '../../data/model/request/login_request.dart';
import '../../data/model/response/login_model.dart';
import '../../domain/usecase/login_usecase.dart';
import '../validator/login_validator.dart';

class LoginController extends GetxController with LoginValidator {
  LoginController({required this.useCase});
  final LoginUseCase useCase;
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // variable
  RxBool isValidateEmail = RxBool(false);
  RxBool obscurePasswordText = RxBool(true);
  RxnString emailTextError = RxnString();
  RxnString passwordTextError = RxnString();
  // model
  Rx<LoginModel> loginModel = LoginModel().obs;

  void login() async {
    String email = emailAddressController.value.text.trim();
    String password = passwordController.value.text.trim();
    // validate email - password
    bool isEmailValid = emailValidator(email: email, emailTextError: emailTextError);
    bool isPassworsValid = passwordValidator(password: password, passwordTextError: passwordTextError);
    // request to server for login
    if (isEmailValid && isPassworsValid) {
      LoginRequest request = LoginRequest(email: email, password: password);
      var result = await useCase(request: request);
      result.fold(
        (failure) => CustomSnackBar.failureSnackBar(failure),
        (data) => loginModel.value = data,
      );
    }
  }
}

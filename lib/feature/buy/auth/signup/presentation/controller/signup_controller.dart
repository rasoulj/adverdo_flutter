import 'package:advedro/feature/buy/auth/signup/data/model/request/signup_request.dart';
import 'package:advedro/feature/buy/auth/signup/domain/usecase/signup_usecase.dart';
import 'package:advedro/feature/buy/auth/signup/presentation/validator/signup_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with SignUpValidator {
  SignUpController({required this.signUpUseCase});
  final SignUpUseCase signUpUseCase;
  // text edit controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // variable
  RxnString userNameErrorText = RxnString();
  RxnString firstNameErrorText = RxnString();
  RxnString lastNameErrorText = RxnString();
  RxnString emailErrorText = RxnString();
  RxBool isValidateEmail = RxBool(false);
  RxBool isValidateUserName = RxBool(false);
  RxBool isValidateFirstName = RxBool(false);
  RxBool isValidateLastName = RxBool(false);

  void signUp() async {
    if (checkTextFieldsBeforSignUp()) {
      SignUpRequest request = SignUpRequest();
      var result = await signUpUseCase(request: request);
      result.fold(
        (failure) => null,
        (data) => null,
      );
    }
  }

  bool checkTextFieldsBeforSignUp() {
    bool isEmail = isEmailValid(emailController.value.text.trim(), emailErrorText);
    bool isUserName = isUserNameValid(userNameController.value.text.trim(), userNameErrorText);
    bool isFirstName = isFirstNameValid(firstNameController.value.text.trim(), firstNameErrorText);
    bool isLastName = isLastNameValid(lastNameController.value.text.trim(), lastNameErrorText);
    if (isEmail && isUserName && isFirstName && isLastName) {
      return true;
    } else {
      return false;
    }
  }
}

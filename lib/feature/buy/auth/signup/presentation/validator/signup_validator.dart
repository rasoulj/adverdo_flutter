import 'package:advedro/config/language/language_key.dart';
import 'package:get/get.dart';

class SignUpValidator {
  bool isUserNameValid(String value, RxnString usernameErrorText) {
    if (value.isNotEmpty) {
      usernameErrorText.value = null;
      return true;
    } else {
      usernameErrorText.value = LanguageKeys.thisUserNameHasAlreadyBeenRegistered;
      return false;
    }
  }

  bool isFirstNameValid(String value, RxnString firstnameErrorText) {
    if (value.isNotEmpty) {
      firstnameErrorText.value = null;
      return true;
    } else {
      firstnameErrorText.value = LanguageKeys.enterYourFirstName.tr;
      return false;
    }
  }

  bool isLastNameValid(String value, RxnString lastnameErrorText) {
    if (value.isNotEmpty) {
      lastnameErrorText.value = null;
      return true;
    } else {
      lastnameErrorText.value = LanguageKeys.enterYourLastName.tr;
      return false;
    }
  }

  bool isEmailValid(String value, RxnString emailErrorText) {
    if (value.isNotEmpty && value.isEmail) {
      emailErrorText.value = null;
      return true;
    } else {
      emailErrorText.value = LanguageKeys.emailIsNotValid.tr;
      return false;
    }
  }

  // onChange Validators
  void emailOnChangeValidator({required String value, required RxBool isValidateEmail, required RxnString emailErrorText}) {
    if (value.isEmpty || !value.isEmail) {
      isValidateEmail(false);
    } else {
      emailErrorText.value = null;
      isValidateEmail(true);
    }
  }

  void userNameOnChangeValidator({required String value, required RxBool isValidateUserName, required RxnString userNameErrorText}) {
    if (value.isEmpty) {
      isValidateUserName(false);
    } else {
      userNameErrorText.value = null;
      isValidateUserName(true);
    }
  }

  void firstNameOnChangeValidator({required String value, required RxBool isValidateFirstName, required RxnString firstNameErrorText}) {
    if (value.isEmpty) {
      isValidateFirstName(false);
    } else {
      firstNameErrorText.value = null;
      isValidateFirstName(true);
    }
  }

  void lastNameOnChangeValidator({required String value, required RxBool isValidateLastName, required RxnString lastNameErrorText}) {
    if (value.isEmpty) {
      isValidateLastName(false);
    } else {
      lastNameErrorText.value = null;
      isValidateLastName(true);
    }
  }
}

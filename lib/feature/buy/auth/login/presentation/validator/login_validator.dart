import 'package:get/get.dart';
import '../../../../../../config/language/language_key.dart';

class LoginValidator {
  void isEmail({required String value, required RxBool isValidEmail}) {
    if (value.isEmail) {
      isValidEmail.value = true;
    } else {
      isValidEmail.value = false;
    }
  }

  bool emailValidator({required String email, required RxnString emailTextError}) {
    if (email.isEmail) {
      emailTextError.value = null;
      return true;
    } else {
      emailTextError.value = LanguageKeys.emailTextError.tr;
      return false;
    }
  }

  bool passwordValidator({required String password, required RxnString passwordTextError}) {
    if (password.isNotEmpty && password.length >= 8 && !password.isNumericOnly) {
      passwordTextError.value = null;
      return true;
    } else {
      passwordTextError.value = LanguageKeys.passwordTextError.tr;
      return false;
    }
  }
}

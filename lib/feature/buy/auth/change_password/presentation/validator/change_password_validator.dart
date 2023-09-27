import 'package:advedro/core/utils/ui_errors/ui_errors.dart';

enum ChangePasswordFieldsEnum { currentPassword, newPassword, confirmPassword }

class ChangePasswordErrors {
  bool _isValidPassword(String pass) {
    return pass.isNotEmpty && pass.length >= 5;
  }

  Map<ChangePasswordFieldsEnum, String?> validator(Map<ChangePasswordFieldsEnum, dynamic> values) {
    String currentPassword = getStringField(values, ChangePasswordFieldsEnum.currentPassword);
    String newPassword = getStringField(values, ChangePasswordFieldsEnum.newPassword);
    String confirmPassword = getStringField(values, ChangePasswordFieldsEnum.confirmPassword);

    String? msgCur, msgNew, msgConfirm;
    if (!_isValidPassword(currentPassword)) msgCur = "Current password is not valid";
    if (!_isValidPassword(newPassword)) msgNew = "New password is not valid";
    if (_isValidPassword(currentPassword) && _isValidPassword(newPassword)) {
      if (newPassword != confirmPassword) {
        msgConfirm = "New password do not match its confirmation";
      } else if (newPassword == currentPassword) {
        msgNew = "New message cannot be same as your old password";
      }
    }

    return {
      ChangePasswordFieldsEnum.currentPassword: msgCur,
      ChangePasswordFieldsEnum.newPassword: msgNew,
      ChangePasswordFieldsEnum.confirmPassword: msgConfirm,
    };
  }
}

/*
class ChangePasswordErrors {

  static bool _isValidPassword(String pass) {
    return pass.isNotEmpty && pass.length >= 5;
  }

  factory ChangePasswordErrors.findErrors({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) {

    String? msgCur, msgNew, msgConfirm;
    if(!_isValidPassword(currentPassword)) msgCur = "Current password is not valid";
    if(!_isValidPassword(newPassword)) msgNew = "New password is not valid";
    if(_isValidPassword(currentPassword) && _isValidPassword(newPassword)) {
      if(newPassword != confirmPassword) {
        msgConfirm = "New password do not match its confirmation";
      } else if(newPassword == currentPassword) {
        msgNew = "New message cannot be same as your old password";
      }

    }


    return ChangePasswordErrors(
      currentPasswordMsg: msgCur,
      newPasswordMsg: msgNew,
      confirmPasswordMsg: msgConfirm,
    );
  }

  final String? currentPasswordMsg;
  final String? newPasswordMsg;
  final String? confirmPasswordMsg;

  ChangePasswordErrors({
    this.currentPasswordMsg,
    this.newPasswordMsg,
    this.confirmPasswordMsg,
  });

  bool get ok => [
    currentPasswordMsg,
    newPasswordMsg,
    confirmPasswordMsg,
  ].every((e) => e == null);

  @override
  String toString() {
    return "ChangePasswordErrors(${ok ? "OK" : "!OK"}){P=$currentPasswordMsg, N=$newPasswordMsg, C=$confirmPasswordMsg}";
  }
}
*/

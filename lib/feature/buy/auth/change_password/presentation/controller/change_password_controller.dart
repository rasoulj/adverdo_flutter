import 'package:advedro/core/utils/ui_errors/ui_errors.dart';

import '../../data/model/request/change_password_request.dart';
import '../../data/model/response/change_password_model.dart';
import '../../domain/usecase/change_password_usecase.dart';
import '../validator/change_password_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController with ChangePasswordErrors {
  ChangePasswordController({required this.useCase});

  final ChangePasswordUseCase useCase;
  final TextEditingController currentController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController oldController = TextEditingController();

  final Rx<ChangePasswordModel> changePasswordModel = ChangePasswordModel().obs;
  final Rx<UiErrors<ChangePasswordFieldsEnum>> errors = UiErrors<ChangePasswordFieldsEnum>().obs;

  void changePassword() async {
    String current = currentController.value.text.trim();
    String newPassword = oldController.value.text.trim();
    String confirm = confirmController.value.text.trim();

    var errs = UiErrors<ChangePasswordFieldsEnum>(validator: validator, values: {ChangePasswordFieldsEnum.currentPassword: current, ChangePasswordFieldsEnum.newPassword: newPassword, ChangePasswordFieldsEnum.confirmPassword: confirm});

    if (errs.ok) {
      ChangePasswordRequest request = ChangePasswordRequest(currentPassword: current, newPassword: newPassword);
      var result = await useCase(request: request);
      result.fold(
        (failure) => null,
        (data) {
          changePasswordModel.value = data;
        },
      );
    }

    errors.value = errs;
  }
}

import 'package:advedro/core/utils/ui_errors/ui_errors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/request/account_detail_request.dart';
import '../../data/model/response/account_detail_model.dart';
import '../../domain/usecase/account_detail_usecase.dart';
import '../validator/account_detail_validator.dart';

class AccountDetailController extends GetxController with AccountDetailErrors {
  AccountDetailController({required this.useCase});

  final AccountDetailUseCase useCase;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final Rx<AccountDetailModel> saveModel = AccountDetailModel().obs;
  final Rx<UiErrors<AccountDetailFieldsEnum>> errors = UiErrors<AccountDetailFieldsEnum>().obs;

  void save() async {
    String firstName = firstNameController.value.text.trim();
    String email = emailController.value.text.trim();
    String lastName = lastNameController.value.text.trim();

    var errs = UiErrors<AccountDetailFieldsEnum>(validator: validator, values: {AccountDetailFieldsEnum.firstName: firstName, AccountDetailFieldsEnum.lastName: email, AccountDetailFieldsEnum.email: lastName});

    if (errs.ok) {
      AccountDetailRequest request = AccountDetailRequest(currentPassword: firstName, newPassword: email);
      var result = await useCase(request: request);
      result.fold(
        (failure) => null,
        (data) {
          saveModel.value = data;
        },
      );
    }

    errors.value = errs;
  }
}

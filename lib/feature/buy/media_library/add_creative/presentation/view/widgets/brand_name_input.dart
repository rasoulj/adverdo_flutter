import 'package:advedro/common/common.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:advedro/feature/buy/media_library/add_creative/presentation/controller/add_creative_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandNameInput extends GetView<AddCreativeController> {
  const BrandNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedTextField(
      validator: lengthValidator(5, "Minimum length for Brand Name is 5"),
      controller: controller.brandNameController,
      maxLength: 100,
      labelText: 'Brand Name',
    );
  }
}

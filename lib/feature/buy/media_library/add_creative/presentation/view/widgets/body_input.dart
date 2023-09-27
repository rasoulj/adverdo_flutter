import 'package:advedro/common/common.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:advedro/feature/buy/media_library/add_creative/presentation/controller/add_creative_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyInput extends GetView<AddCreativeController> {
  const BodyInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedTextField(
      validator: lengthValidator(5, "Minimum length for Body is 5"),
      controller: controller.bodyController,
      maxLength: 150,
      labelText: 'Body',
    );
  }
}

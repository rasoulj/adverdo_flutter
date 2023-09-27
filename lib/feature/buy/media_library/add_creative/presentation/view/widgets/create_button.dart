import 'package:advedro/config/theme/app_designs.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/add_creative_controller.dart';

class CreateButton extends GetView<AddCreativeController> {
  const CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Get.theme.colorScheme.secondary,
          shape: AppDesigns.getCircularBorder(radius: 10),
        ),
        onPressed: controller.create,
        child: const Text("Create"),
      ),
    );
  }
}

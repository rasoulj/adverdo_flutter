import 'package:advedro/common/common.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/add_creative_controller.dart';

class ApplyNowInput extends GetView<AddCreativeController> {
  const ApplyNowInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(
          color: Colors.grey,
        ), ),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 26.0, bottom: 16),
        child: InkWell(
          onTap: onSelect,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(controller.applyNow ?? "Apply Now")),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  void onSelect() async {
    String? selected = await MultiSelect<String>(
      List.generate(30, (index) => "Item # ${index+1}"),
      selected: {controller.applyNow ?? ""},
        title: Text("Select an Action", style: Get.textTheme.titleLarge,),
      iconBuilder: (str) => const Icon(Icons.circle)
    )();
    if(selected == null) return;

    controller.applyNow = selected;
    Get.snackbar("Selected", selected);
  }
}

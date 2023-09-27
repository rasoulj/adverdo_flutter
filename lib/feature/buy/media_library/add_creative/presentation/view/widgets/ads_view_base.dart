import 'package:advedro/common/common.dart';
import 'package:advedro/feature/buy/media_library/add_creative/data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/add_creative_controller.dart';
import 'create_button.dart';
import 'dotted_progress_bar.dart';

class AdsViewBase extends GetView<AddCreativeController> {
  const AdsViewBase({super.key});

  Future<bool> onWillPop() async {
    controller.clear();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(controller.stage.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DottedProgressBar(
                length: 2,
                value: 2,
                onPress: () {
                  onWillPop();
                  Get.back();
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    autovalidateMode: AutovalidateMode.disabled,
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TaggedInput(controller: controller.tagsController),
                        ),
                        ...bodyWidgets,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        persistentFooterButtons: const [
          CreateButton(),
        ],
      ),
    );
  }

  List<Widget> get bodyWidgets => const [];

}
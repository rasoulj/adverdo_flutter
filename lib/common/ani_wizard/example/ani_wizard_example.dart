import 'dart:async';

import 'package:advedro/core/utils/dev_utils/example_runner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ani_wizard.dart';

void main() async {
  AniWizardController controller = AniWizardController(count: 4);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ExampleRunner(
    isDark: true,
    child: Column(
      children: [
        Card(
            child: FlutterLogo(
          size: Get.width,
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AniWizard(
            controller: controller,
            info: [
              AniWizardWidgetInfo(
                button2: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  onPressed: () => controller.stage = 1,
                  label: const Text("Delete"),
                  icon: const Icon(Icons.delete),
                ),
              ),
              AniWizardWidgetInfo(
                height: 50,
                widget: const Card(child: Center(child: Text("Are you sure to delete this?"))),
                button1: ElevatedButton.icon(
                  onPressed: () => controller.stage = 0,
                  label: const Text("Cancel"),
                  icon: const Icon(Icons.cancel),
                ),
                button2: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    controller.stage = 2;
                    Timer(3.seconds, () {
                      Get.snackbar("DONE", "message");
                      controller.stage = 3;
                    });
                  },
                  label: const Text("Confirm"),
                  icon: const Icon(Icons.check_circle),
                ),
              ),
              const AniWizardWidgetInfo(
                height: 5,
                widget: LinearProgressIndicator(),
              ),
              AniWizardWidgetInfo(
                  button1: ElevatedButton(
                    onPressed: () => controller.stage = 0,
                    child: const Text("RESET"),
                  ),
                  height: 70,
                  widget: Container(color: Colors.green, child: const Center(child: Text("DONE!!")))),
            ],
          ),
        ),
      ],
    ),
  ));
}

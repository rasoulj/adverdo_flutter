
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'ani_wizard_widget_info.dart';

class AniWizard extends StatelessWidget {
  final List<AniWizardWidgetInfo> info;

  late final AniWizardController? controller;

  AniWizard({
    Key? key,
    this.controller,
    required this.info,
  }) : super(key: key) {
    controller ??= AniWizardController();
  }

  @override
  Widget build(BuildContext context) => Obx(() => info[controller!.stage].view);
}

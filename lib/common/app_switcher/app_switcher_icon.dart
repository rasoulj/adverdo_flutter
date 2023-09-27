import 'package:advedro/core/data/enums/app_view_enum.dart';
import 'package:advedro/common/common.dart';
import 'package:advedro/feature/buy/buy_home/presentation/controller/buy_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'switcher_content.dart';

/// An [IconButton] used for switching between buy and tracker mode,
/// It uses [HomeController]
class AppSwitcherIcon extends GetView<HomeController> {
  const AppSwitcherIcon({super.key});

  void onClick() {
    Get.dialog(
      const AdvDialog(
        child: SwitcherContent(),
      ),
      useSafeArea: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent.withAlpha(100), width: 4.0),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              //This keeps the splash effect within the circle
              borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
              onTap: onClick,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: icon,
              ),
            ),
          )
      ),
    );

    return IconButton(
        onPressed: onClick,
        // iconSize: 12,
        icon: icon,
    );
  }

  Widget get icon => Container(
    width: 32,
    height: 32,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      image: DecorationImage(
          scale: 0.1,
          image: AssetImage(controller.appView.image),
          fit: BoxFit.fill
      ),
    ),
  );
}

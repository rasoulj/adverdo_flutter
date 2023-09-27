import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  const CustomFloatingActionButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Get.theme.badgeTheme.backgroundColor,
      shape: AppDesigns.fabShape,
      onPressed: onPressed,
      child: child,
    );
  }
}

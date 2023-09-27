import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';

class AdvCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  const AdvCard({
    Key? key,
    this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: AppDesigns.defaultElevation,
      shape: AppDesigns.cardShape,
      margin: AppDesigns.cardMargin,
      child: child,
    );
  }
}

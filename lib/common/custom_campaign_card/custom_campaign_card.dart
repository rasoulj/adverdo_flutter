import 'package:flutter/material.dart';

import '../../config/dimension/dimension.dart';

class CustomCampaignCard extends StatelessWidget {
  const CustomCampaignCard({
    super.key,
    this.height,
    this.width,
    this.padding,
    required this.child,
    required this.color,
  });

  final double? height;
  final double? width;
  final Widget child;
  final Color color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 139.0,
      width: width ?? Dimensions.width(context),
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8),
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 4.0,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardTitle extends StatelessWidget {
  final String title;

  const DashboardTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8),
      child: Row(
        children: [
          Text(
            title,
            style: Get.textTheme.titleLarge?.copyWith(color: Get.iconColor),
          ),
        ],
      ),
    );
  }
}

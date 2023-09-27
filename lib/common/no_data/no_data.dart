import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoData extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;

  const NoData({Key? key,
    required this.title,
    this.icon,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon != null) Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(icon!, size: 44,),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: Get.textTheme.titleLarge, softWrap: true,),
                  if(subtitle != null) Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(subtitle!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

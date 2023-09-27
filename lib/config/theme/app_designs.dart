import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppDesigns {
  static const double defaultRadius = 15;
  static const double defaultElevation = 5;
  static const double defaultOpacity = 0.7;

  static final errorStyle = TextStyle(backgroundColor: Get.theme.colorScheme.error.withAlpha(40));

  static final titleBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.elliptical(1.2 * Get.width, 36.0),
    ),
  );

  static getCircularBorder({double radius = defaultRadius, BorderSide side = BorderSide.none}) => RoundedRectangleBorder(
    side: side,
    borderRadius: BorderRadius.all(Radius.circular(radius))
  );

  static final fabShape = AppDesigns.getCircularBorder();

  static final cardShape = AppDesigns.getCircularBorder();

  static const topCircular = BorderRadius.only(topLeft: Radius.circular(defaultRadius), topRight: Radius.circular(defaultRadius));

  static const cardMargin = EdgeInsets.all(8);

}
import 'package:flutter/material.dart';

class Dimensions {
  static const double kLoginHeight = 441.0;
  static const double kDefaultHeight = 58.0;
  static const double kDefaultMargin = 20;
  static const double kdefaultHorizontal = 24.0;
  static const double mediumSpace = 12.0;

  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double halfHeight(BuildContext context) {
    return MediaQuery.of(context).size.height / 2;
  }

  static double halfWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 2;
  }

  // static double doubleWidth(BuildContext context) {
  //   return MediaQuery.of(context).size.width / 2;
  // }
}

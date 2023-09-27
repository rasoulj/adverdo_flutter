import 'package:advedro/config/consts/light_mode_colors.dart';
import 'package:flutter/material.dart';

class LightTextTheme {
  static const TextTheme textTheme = TextTheme(
    // body
    bodySmall: TextStyle(color: LightModeColors.navyBlue, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: "ubuntu_r"),
    bodyMedium: TextStyle(color: LightModeColors.navyBlue, fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: "ubuntu_r"),
    bodyLarge: TextStyle(color: LightModeColors.navyBlue, fontSize: 15.0, fontWeight: FontWeight.w400, fontFamily: "ubuntu_r"),
    // title
    titleLarge: TextStyle(color: LightModeColors.primaryColorDark, fontSize: 20.0, fontWeight: FontWeight.w400, fontFamily: "ubuntu_r"),
    titleMedium: TextStyle(color: LightModeColors.primaryColorDark, fontSize: 20.0, fontWeight: FontWeight.w400, fontFamily: "ubuntu_r"),
    titleSmall: TextStyle(color: LightModeColors.primaryColorDark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: "ubuntu_r"),
    // headLine
    headlineLarge: TextStyle(color: LightModeColors.navyBlue, fontSize: 28.0, fontWeight: FontWeight.w700, fontFamily: "ubuntu_r"),
    headlineMedium: TextStyle(color: LightModeColors.navyBlue, fontSize: 24.0, fontWeight: FontWeight.w700, fontFamily: "ubuntu_r"),
    // label
    labelSmall: TextStyle(color: LightModeColors.red, fontSize: 11.0, fontWeight: FontWeight.w400, fontFamily: "ubuntu_r"),
    // display
    displayMedium: TextStyle(color: LightModeColors.navyBlue, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: "ubuntu_r"),
  );
}

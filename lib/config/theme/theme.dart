import 'package:advedro/config/theme/app_designs.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:flutter/material.dart';
import '../consts/light_mode_colors.dart';
import 'light_text_theme.dart';


class ThemeService {
  final darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      secondary: Colors.redAccent,
    ),

    appBarTheme: ThemeData
        .dark()
        .appBarTheme
        .copyWith(
      shape: AppDesigns.titleBarShape,
      toolbarHeight: 70,
    ),
    badgeTheme: ThemeData
        .dark()
        .badgeTheme
        .copyWith(
        backgroundColor: LightModeColors.green
    ),

    primaryColor: Colors.blue,
  );

  final lightTheme = ThemeData.light().copyWith(
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
      shape: AppDesigns.titleBarShape,
      toolbarHeight: 70,
    ),
    badgeTheme: ThemeData.light().badgeTheme.copyWith(
        backgroundColor: LightModeColors.green
    ),
    scaffoldBackgroundColor: Colors.grey[100],

    primaryColor: LightModeColors.primaryColor,
    primaryColorLight: LightModeColors.primaryColorLight,
    primaryColorDark: LightModeColors.primaryColorDark,
    textTheme: LightTextTheme.textTheme,
    colorScheme: const ColorScheme.light(
      error: LightModeColors.red,
      // onPrimary: LightModeColors.navyBlue,
      // primary: LightModeColors.primaryColor,
      onSecondary: LightModeColors.white,
    ),
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.light(
        secondary: LightModeColors.green,
        background: Color(0xffFF4388),
        onBackground: Color(0xffD42767),
        onSurface: Color(0xff0F0039),
        onSecondary: Color(0xffFFFFFF),
      ),
    ),
  );
}
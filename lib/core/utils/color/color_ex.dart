import 'package:flutter/material.dart';

extension ColorEx on Color {
  Color withLightness([double lightness = 0.8]) {
    return HSLColor.fromColor(this).withLightness(lightness).toColor();
  }
}
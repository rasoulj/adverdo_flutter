import 'package:flutter/material.dart';

class CustomGradient {
  static get authGradient => const LinearGradient(
        colors: [
          Color(0xffE9CCEB),
          Color(0xffFFFFFF),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 100.0],
      );
}

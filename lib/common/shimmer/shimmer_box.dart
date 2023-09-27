import 'package:flutter/material.dart';

class ShimmerBox extends StatelessWidget {
  final double height, width;
  const ShimmerBox({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(height/2)),
      ),
    );
  }

  factory ShimmerBox.circle([double radius = 40]) => ShimmerBox(height: radius, width: radius);

}

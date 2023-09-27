import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DottedProgressBar extends StatelessWidget {
  final int length;
  final int value;
  final VoidCallback? onPress;
  const DottedProgressBar({Key? key, required this.length, required this.value, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "DottedProgressBar",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, _getWidget),
      ),
    );
  }


  Widget _getWidget(int index) {
    bool selected = index+1 > value;

    return InkWell(
      onTap: !selected ? onPress ?? Get.back : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Icon(Icons.circle,
          size: 16,
          color: Get.theme.primaryColor.withOpacity(selected ? 0.3 : 1),
      ),),
    );
  }
}

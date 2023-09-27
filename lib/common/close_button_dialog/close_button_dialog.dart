import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseButtonDialog<T> extends StatelessWidget {
  final T value;
  const CloseButtonDialog({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.back(result: null),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: Colors.grey[400],
      ),
      child: const Icon(Icons.close, size: 20, color: Colors.black,),
    );
  }
}

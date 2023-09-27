import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvDialog extends StatelessWidget {
  const AdvDialog({Key? key, required this.child}) : super(key: key);

  final Widget child;

  void _closeMe() {
    Get.back();
  }

  Widget get _closeButton =>
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: RawMaterialButton(
          fillColor: Get.theme.cardColor,
          onPressed: _closeMe,
          // padding: const EdgeInsets.all(0),
          shape: const CircleBorder(),
          child: Icon(Icons.close, color: Get.iconColor),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _closeMe,
      child: Container(
        color: Colors.white.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: child,
                ),
              ),
            ),
            _closeButton,
          ],
        ),
      ),
    );
  }
}

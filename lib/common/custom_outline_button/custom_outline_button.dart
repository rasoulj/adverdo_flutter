import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/asset_resource/asset_resource_icons.dart';
import '../../config/dimension/dimension.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.0,
      width: Dimensions.width(context) - 60.0,
      child: MaterialButton(
        height: 72.0,
        minWidth: Dimensions.width(context) - 60.0,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: Get.theme.primaryColorDark, width: 1.0),
        ),
        color: Get.theme.buttonTheme.colorScheme?.onSecondary,
        onPressed: onPressed,
        child: Stack(
          children: [
            Positioned(
              top: 25.0,
              left: 27.0,
              child: Text(title, style: Get.theme.textTheme.titleLarge),
            ),
            Positioned(
              top: 24.0,
              right: 35.0,
              child: SizedBox(
                height: 24.0,
                width: 24.0,
                child: Icon(
                  AssetResource.rightArrow,
                  color: Get.theme.primaryColorDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

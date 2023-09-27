import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/asset_resource/asset_resource_icons.dart';
import '../../config/consts/light_mode_colors.dart';
import '../../config/dimension/dimension.dart';

class CustomDisableButton extends StatelessWidget {
  const CustomDisableButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.0,
      width: Dimensions.width(context) - 60.0,
      child: MaterialButton(
        height: 72.0,
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        minWidth: Dimensions.width(context) - 60.0,
        color: Get.theme.buttonTheme.colorScheme?.background.withOpacity(0.5),
        onPressed: () {},
        child: Stack(
          children: [
            Positioned(
              top: 25.0,
              left: 27.0,
              child: Text(
                title,
                style: Get.theme.textTheme.titleMedium,
              ),
            ),
            Positioned(
              top: 17.0,
              right: 47.0,
              child: SizedBox(
                height: 38.0,
                width: 38.0,
                child: CircleAvatar(backgroundColor: LightModeColors.redShade700.withOpacity(0.2)),
              ),
            ),
            Positioned(
              top: 24.0,
              right: 35.0,
              child: SizedBox(
                height: 24.0,
                width: 24.0,
                child: Icon(
                  AssetResource.rightArrow,
                  color: Get.theme.colorScheme.onBackground.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

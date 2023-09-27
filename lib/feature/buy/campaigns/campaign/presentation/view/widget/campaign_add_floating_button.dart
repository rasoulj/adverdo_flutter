import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/asset_resource/asset_resource_icons.dart';

class CampaignAddFloatingButton extends StatelessWidget {
  const CampaignAddFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.amber,
      focusColor: Colors.amberAccent,
      child: Container(
        height: 48.0,
        width: 48.0,
        decoration: BoxDecoration(
          color: Get.theme.badgeTheme.backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Icon(
            AssetResource.plus,
            color: Get.theme.primaryColorLight,
            size: 18.0,
          ),
        ),
      ),
    );
  }
}

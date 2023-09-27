import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/asset_resource/asset_resource_icons.dart';
import '../../../../../../../config/dimension/dimension.dart';

class CampaignIconButtons extends StatelessWidget {
  const CampaignIconButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.0,
      width: Dimensions.width(context),
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.onSecondary.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(6.0),
          bottomRight: Radius.circular(6.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: InkWell(
              onTap: () {},
              child: Icon(
                AssetResource.pause,
                color: Get.theme.colorScheme.onSecondary,
                size: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: Icon(
              AssetResource.edit,
              color: Get.theme.colorScheme.onSecondary,
              size: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: Icon(
              AssetResource.moreHoriz,
              color: Get.theme.colorScheme.primary,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

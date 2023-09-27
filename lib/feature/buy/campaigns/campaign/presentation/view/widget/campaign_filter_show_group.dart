import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/asset_resource/asset_resource_icons.dart';
import '../../../../../../../config/dimension/dimension.dart';
import '../../../../../../../config/language/language_key.dart';

class CampaignFiltersAndShowGroup extends StatelessWidget {
  const CampaignFiltersAndShowGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: Dimensions.width(context),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Row(
              children: [
                const Icon(AssetResource.fingerPrint, size: 20.0),
                const SizedBox(width: 3.0),
                Text(LanguageKeys.filters.tr, style: Get.textTheme.bodySmall),
              ],
            ),
          ),
          InkWell(
            child: Row(
              children: [
                const Icon(AssetResource.layer, size: 20.0),
                const SizedBox(width: 3.0),
                Text(LanguageKeys.showGroup.tr, style: Get.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

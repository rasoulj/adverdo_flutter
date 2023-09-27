import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../config/asset_resource/asset_resource_icons.dart';
import '../../../../../../../config/language/language_key.dart';
import '../../controller/campaign_controller.dart';
import '../../enum/campaign_enum.dart';

class CampaignROI extends GetView<CampaignController> {
  const CampaignROI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              LanguageKeys.roi.tr,
              style: Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300),
            ),
            const SizedBox(width: 7.0),
            Container(
              height: 32.0,
              width: 68.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Get.theme.colorScheme.onSecondary,
              ),
              child: Center(
                child: Text(
                  '0:00%',
                  style: Get.textTheme.titleMedium?.copyWith(fontSize: 15.0),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 113.0,
          height: 33.0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 33.0,
                width: 113.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Get.theme.colorScheme.onSecondary.withOpacity(0.2),
                ),
              ),
              Container(
                color: Get.theme.cardColor,
                height: 31.0,
                width: 57.0,
                child: Center(
                  child: Obx(
                    () => Text(
                      controller.roiVolume.value.toStringAsFixed(2),
                      style: Get.textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => controller.upRoiVolume(CampaignVolumeEnum.up),
                  child: const SizedBox(
                    height: 32.0,
                    width: 28.0,
                    child: Center(child: Icon(AssetResource.chevronUp, size: 16.0)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => controller.upRoiVolume(CampaignVolumeEnum.down),
                  child: const SizedBox(
                    height: 32.0,
                    width: 28.0,
                    child: Center(child: Icon(AssetResource.chevronDown, size: 16.0)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

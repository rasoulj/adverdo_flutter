import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/asset_resource/asset_resource_icons.dart';
import '../../../../../../config/dimension/dimension.dart';
import '../../../../../../config/language/language_key.dart';
import '../controller/campaign_controller.dart';
import 'widget/campaign_add_floating_button.dart';
import 'widget/campaign_filter_show_group.dart';
import 'widget/campaign_listview.dart';

class CampaignView extends GetView<CampaignController> {
  const CampaignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKeys.campaign.tr),
        leading: IconButton(onPressed: () {}, icon: const Icon(AssetResource.search)),
      ),
      body: SizedBox(
        height: Dimensions.height(context),
        width: Dimensions.width(context),
        child: Column(
          children: const [
            CampaignFiltersAndShowGroup(),
            CampaignListView(),
          ],
        ),
      ),
      floatingActionButton: const CampaignAddFloatingButton(),
    );
  }
}

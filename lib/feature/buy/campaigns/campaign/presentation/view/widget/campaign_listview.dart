import 'package:flutter/material.dart';

import '../../../../../../../common/custom_campaign_card/custom_campaign_card.dart';
import 'campaign_icon_buttons.dart';
import 'campaign_roi.dart';
import 'campaign_title_badge.dart';

class CampaignListView extends StatelessWidget {
  const CampaignListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.only(top: 16),
        itemBuilder: (BuildContext context, int index) {
          // CampaignPresenter presenter = CampaignPresenter(controller.campaignModel.value.items?[index]);
          return CustomCampaignCard(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    children: const [
                      SizedBox(height: 13.0),
                      CampaignTitleAndBadge(),
                      SizedBox(height: 18.0),
                      CampaignROI(),
                    ],
                  ),
                ),
                const CampaignIconButtons()
              ],
            ),
          );
        },
      ),
    );
  }
}

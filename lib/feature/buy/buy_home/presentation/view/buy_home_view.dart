import 'package:advedro/config/asset_resource/asset_resource_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../campaigns/campaign/presentation/view/campaign_view.dart';
import '../../../dashboard/buy_dashboard/presentation/view/buy_dashboard_view.dart';
import '../../../media_library/media_groups/presentation/view/media_groups_view.dart';
import '../../../temp/presentation/view/test_page1/test_page1.dart';
import '../../../user_profile/more_page/presentation/more_view.dart';
import '../controller/buy_home_controller.dart';

abstract class AppStyles {
  static const borderBottom = BorderRadius.only(
    topRight: Radius.circular(cardBorderRadius),
    topLeft: Radius.circular(cardBorderRadius),
  );
  static const double cardBorderRadius = 25;
}

class _TabModel {
  final String title;
  final IconData icon;
  final int index;

  const _TabModel(this.title, this.icon, this.index);

  GButton get button => GButton(
        text: title,
        icon: icon,
        padding: const EdgeInsets.all(12),
      );

  // FlashyTabBarItem get flashyItem => FlashyTabBarItem(icon: Icon(icon), title: Text(title));

  static const List<_TabModel> all = [
    _TabModel("Dashboard", Icons.access_time, 0),
    _TabModel("Campaigns", AssetResource.targetLock, 1),
    _TabModel("Media Library", AssetResource.media, 3),
    _TabModel("Rule Library", AssetResource.ideaLamp, 2),
    _TabModel("More", AssetResource.moreVert, 4),
  ];
}

class BuyHomeView extends GetView<HomeController> {
  const BuyHomeView({super.key});

  Widget get bottomNavigationBar =>
      Container(
        // padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.black : Colors.white,
            border: Border(
                top: BorderSide(
                  color: Colors.grey[500]!,
                  width: 0.5,
                ))),
        child: SafeArea(
          child: GNav(
            gap: 8,
            activeColor: Get.theme.colorScheme.primary,
            tabs: _TabModel.all.map((e) => e.button).toList(),
            selectedIndex: controller.buyTabIndex,
            onTabChange: (index) => controller.buyTabIndex = index,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    var index = controller.buyTabIndex;

    return Scaffold(
      body: IndexedStack(
        index: index,
        children: const [
          BuyDashboardView(),
          CampaignView(),
          MediaGroupsView(),
          TestPage1(),
          MoreView(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}


import 'package:advedro/common/common.dart';
import 'package:advedro/config/routes_management/buy_routes_management/buy_routes.dart';
import 'package:advedro/config/theme/app_designs.dart';
import 'package:advedro/core/utils/dev_utils/dev_utils.dart';
import 'package:advedro/feature/buy/media_library/media_groups/data/model/response/media_groups_model.dart';
import 'package:advedro/feature/buy/media_library/medialibraries/presentation/view/creatives_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/response/medialibraries_model.dart';
import '../controller/medialibraries_controller.dart';
import 'creative_view.dart';

class MediaLibrariesView extends GetView<MediaLibrariesController> {
  const MediaLibrariesView({super.key});

  get _onLoading {
    return Column(
      children: [
        const CreativesFilter(),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CreativeView(item: Creative.empty(), isLoading: true);
            },
            itemCount: 40,
          ),
        ),
      ],
    );
  }

  Widget _onError(String? err)  => NoData(
    icon: Icons.error_outline,
    title: err ?? "An error occurred while loading media libraries",
    subtitle: "Try reloading media libraries",
  );


  GroupItem get argument => Get.arguments as GroupItem;

  void addCreative() async {
    Get.toNamed(BuyRoutes.addCreative, arguments: argument);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(argument.name),
        //actions: const [AppSwitcherIcon()],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: addCreative,
        child: const Icon(Icons.add),
      ),
      body: Shimmer(
        child: controller.obx(
          _buildSuccess,
          onLoading: _onLoading,
          onError: _onError,
          onEmpty: _empty,
        ),
      ),
    );
  }

  Widget get _empty => const NoData(
    icon: Icons.perm_media,
    title: "No Media exists",
    subtitle: "Press + to add new media",
  );

  Widget _buildSuccess(MediaLibrariesModel? state) {
    var items = ListMul(state?.creatives ?? [])(15);
    return Column(
      children: [
        const CreativesFilter(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return CreativeView(item: items[index], isLoading: false);
            },
            itemCount: items.length,
          ),
        ),
      ],
    );
  }

}

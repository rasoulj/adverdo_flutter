import 'dart:async';

import 'package:advedro/common/common.dart';
import 'package:advedro/config/routes_management/buy_routes_management/buy_routes.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:advedro/feature/buy/media_library/media_groups/presentation/view/search_media_groups.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../data/model/response/media_groups_model.dart';
import '../controller/media_groups_controller.dart';
import 'group_item_view.dart';

class MediaGroupsView extends GetView<MediaGroupsController> {
  const MediaGroupsView({super.key});

  get _onLoading {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GroupItemView(item: GroupItem.empty(), isLoading: true);
      },
      itemCount: 40,
    );
  }

  Widget _onError(String? err)  => NoData(
    icon: Icons.error_outline,
    title: err ?? "An error occurred while loading media libraries groups",
    subtitle: "Try reloading media libraries groups",
  );

  Future<void> _showSearch() async {
    final selected = await showSearch(context: Get.context!, delegate: SearchMediaGroups(
      controller.items,
    ));
    if(selected == null) return;
    Get.toNamed(BuyRoutes.mediaLibraries, arguments: selected);
  }

  void _createNewGroup() async {
    String? groupName = await InputUtils.inputText(
      header: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text("Input New Group Name", style: Get.textTheme.titleLarge,),
      ),
      decoration: const InputDecoration(hintText: "Enter new group name"),
      validator: controller.isValidName
    );
    if((groupName ?? "") == "") return;

    EasyLoading.show(
      indicator: const CircularProgressIndicator(
        color: Colors.white,
      ),
      status: "Please wait ...",
      maskType: EasyLoadingMaskType.black,
    );
    Timer(2.seconds, () async {
      EasyLoading.dismiss();
      final groupItem = await controller.createGroup(groupName ?? "");
      if( groupItem == null) return;
      Get.toNamed(BuyRoutes.addCreative, arguments: groupItem);

      EasyLoading.showSuccess("Item has been ADDED successfully!",
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Libraries'),
        actions: const [AppSwitcherIcon()],
        leading: IconButton(onPressed: _showSearch, icon: const Icon(Icons.search),),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: _createNewGroup,
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
    icon: Icons.hourglass_empty,
    title: "No Group exists",
    subtitle: "Press + to add new group",
  );

  Widget _buildSuccess(MediaGroupsModel? state) {
    var items = state?.items ?? [];
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return GroupItemView(item: items[index], isLoading: false);
      },
      itemCount: items.length,
    );
  }
}

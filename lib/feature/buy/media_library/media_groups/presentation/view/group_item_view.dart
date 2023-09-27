import 'dart:async';

import 'package:advedro/common/common.dart';
import 'package:advedro/config/routes_management/buy_routes_management/buy_routes.dart';
import 'package:advedro/config/theme/app_designs.dart';
import 'package:advedro/core/utils/dev_utils/not_implemented.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../data/model/response/media_groups_model.dart';
import '../controller/media_groups_controller.dart';

class _TermDef extends StatelessWidget {
  final String term, def;
  final bool isLoading;
  const _TermDef({Key? key, required this.term, required this.def, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(term, style: const TextStyle(fontWeight: FontWeight.w200),),
        const SizedBox(width: 7,),
        isLoading ? const ShimmerBox(height: 20, width: 40) : Text(def, style: const TextStyle(fontWeight: FontWeight.w700),),
      ],
    );
  }
}



class GroupItemView extends GetView<MediaGroupsController> {
  final GroupItem item;
  final bool isLoading;
  const GroupItemView({Key? key, required this.item, required this.isLoading}) : super(key: key);

  void onDelete() async {
    bool res = await Ask.question("Are you sure to delete this item?", title: "Delete", yesText: "Yes, Delete!") ?? false;
    if(!res) return;

    EasyLoading.show(
      indicator: const CircularProgressIndicator(color: Colors.white,),
      status: "Please wait ...",
      maskType: EasyLoadingMaskType.black,
    );
    Timer(2.seconds, () {
      EasyLoading.dismiss();
      controller.deleteGroup(item);
      EasyLoading.showSuccess("Item has been deleted successfully!",
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );
    });
  }


  void gotoDetail() {
    Get.toNamed(BuyRoutes.mediaLibraries, arguments: item);
  }

  void addMedia() {
    Get.toNamed(BuyRoutes.addCreative, arguments: item);
  }

  Widget get _buttons => NotchedButtonBar(
    children: [
      isLoading ? ShimmerBox.circle(24) : IconButton(
        onPressed: onDelete,
        icon: const Icon(Icons.delete_forever,),
      ),
      isLoading ? ShimmerBox.circle(24) : Material(
        color: Colors.transparent,
        child: Ink(
          decoration: ShapeDecoration(
            color: Get.theme.badgeTheme.backgroundColor,
            shape: const CircleBorder(),
          ),
          child: IconButton(
            tooltip: "Add New Media ...",
            icon: const Icon(Icons.add,),
            color: Colors.white,
            onPressed: addMedia,
          ),
        ),
      ),
      isLoading ? ShimmerBox.circle(24) : IconButton(
        onPressed: gotoDetail,
        icon: const Icon(Icons.chevron_right),
      ),
    ],
  );

  Widget get _body => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
          height: 32,
          child: isLoading ? const ShimmerBox(height: 30, width: 200) : Text(item.name, style: Get.textTheme.titleLarge,)),
      // const SizedBox(height: 12,),
      SizedBox(
        height: 40,
        child: Row(
          children: [
            Expanded(child: _TermDef(term: "ID:", def: item.id.toString(), isLoading: isLoading,)),
            Expanded(child: _TermDef(term: "Creatives", def: item.creatives.toString(), isLoading: isLoading)),
          ],
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return AdvCard(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ShimmerLoading(
              isLoading: isLoading,
              child: _body,
            ),
          ),
          _buttons,
        ],
      ),
    );
  }

}


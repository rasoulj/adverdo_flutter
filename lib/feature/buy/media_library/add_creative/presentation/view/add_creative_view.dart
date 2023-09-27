import 'package:advedro/common/app_switcher/app_switcher.dart';
import 'package:advedro/common/common.dart';
import 'package:advedro/config/theme/app_designs.dart';
import 'package:advedro/feature/buy/media_library/add_creative/presentation/view/banner_ads_view.dart';
import 'package:advedro/feature/buy/media_library/medialibrary/data/model/ad_types_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../data/data.dart';
import '../controller/add_creative_controller.dart';
import 'widgets/dotted_progress_bar.dart';

class AddCreativeView extends GetView<AddCreativeController> {
  const AddCreativeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Creative"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const DottedProgressBar(length: 2, value: 1,),
            _title,
            Expanded(child: selectAdTypeWidget),
          ],
        ),
      ),
    );
  }


  Widget get _title =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Center(child: Text("Select Ad type:", style: Get.textTheme.titleLarge,)),
      );

  Widget _getTile(AdTypesEnum item) {
    return ListTile(
      shape: const Border(top: BorderSide(width: 0.2)),
      onTap: () {
        controller.stage = item;
        Get.to(item.to, transition: Transition.cupertino, duration: 500.milliseconds);
      },
      title: Text(item.title),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  Widget get selectAdTypeWidget =>
      ListView(
        children: AdTypesEnum
            .values
            .sublist(1)
            .map(_getTile)
            .toList(),
      );

}
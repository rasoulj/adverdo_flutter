import 'package:advedro/core/utils/string/string_ex.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:advedro/feature/buy/media_library/add_creative/data/ad_type_enum.dart';
import 'package:advedro/feature/buy/media_library/medialibraries/data/model/enums/ad_status_enum.dart';
import 'package:advedro/feature/buy/media_library/medialibrary/data/model/ad_types_enum.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/medialibraries_controller.dart';



class InlineFilter extends StatelessWidget {
  final String title;
  final Set<String> values;
  final VoidCallback onPress;

  const InlineFilter({Key? key, required this.title, required this.values, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPress,
      icon: Text(title, style: Get.textTheme.bodySmall,),
      // label: Wrap(children: values.map((e) => TagView(tag: e,)).toList(),),
      label: Text(values.join(", "))
    );
  }
}


class CreativesFilter extends GetView<MediaLibrariesController> {
  const CreativesFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      color: Colors.transparent.withOpacity(0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _filters,
          _adTypes,
        ],
      ),
    );
  }

  Future<void> onSelectTags() async {
    String? value = await MultiSelect<String>(
      controller.tags,
      selected: controller.tagsFilter,
    ).call();

    if(value == null) return;
    controller.toggleTagsFilter(value);
  }

  Future<void> onSelectStatus() async {
    AdStatusEnum? value = await MultiSelect(
      AdStatusEnum.values,
      selected: controller.adStatusFilter,
      toTitle: (e) => e.name.camelToSentence(),
    ).call();

    if (value == null) return;
    controller.toggleAdStatus(value);
  }

  Widget get _filters => Obx(() => Wrap(
    children: [
      TextButton.icon(
        onPressed: null,
        label: const Text("Filters: "),
        icon: const Icon(Icons.filter_alt),
      ),
      InlineFilter(
        title: 'Tags',
        values: controller.tagsFilter.map((e) => e.camelToSentence()).toSet(),
        onPress: onSelectTags,
      ),
      InlineFilter(
        title: 'Status',
        values: controller.adStatusFilter.map((e) => e.name.camelToSentence()).toSet(),
        onPress: onSelectStatus,
      ),
    ],
  ));

  Widget get _adTypes => AnimatedButtonBar(
    radius: 15,
    foregroundColor: Get.theme.primaryColorDark,
    invertedSelection: true,
    children: AdTypesEnum.values.map((e) => ButtonBarEntry(
        child: Text(e.name.camelToSentence()),
        onTap: () => controller.adTypeFilter = e,
    ),).toList(),
  );

}
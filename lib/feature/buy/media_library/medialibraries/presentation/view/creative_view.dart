
import 'dart:async';

import 'package:advedro/common/common.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:advedro/feature/buy/media_library/medialibraries/presentation/view/more_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../data/model/response/medialibraries_model.dart';
import 'tag_view.dart';

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

class CreativeView extends StatelessWidget {
  final Creative item;
  final bool isLoading;

  const CreativeView({Key? key, required this.item, required this.isLoading}) : super(key: key);

  void onDelete() async {
    bool res = await Ask.question("Are you sure to delete this item?", title: "Delete", yesText: "Yes, Delete!") ?? false;
    if (!res) return;

    EasyLoading.show(
      indicator: const CircularProgressIndicator(color: Colors.white,),
      status: "Please wait ...",
      maskType: EasyLoadingMaskType.black,
    );
    Timer(5.seconds, () {
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Item has been deleted successfully!",
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );
    });
  }

  void doMore() async {
    final en = await MultiSelect<MoreActionsEnum>(
      MoreActionsEnum.values,
      title: Text("Actions", style: Get.textTheme.titleLarge,),
      iconBuilder: (e) => e.icon,
      toTitle: (e) => e.name.camelToSentence(),
    ).call();
    if(en == null) return;
    notImplemented();
  }

  Widget get _more => Positioned(
        right: 0,
        top: 0,
        child: IconButton(
          onPressed: doMore,
          icon: const Icon(Icons.more_vert),
        ),
      );

  Widget get _content =>
      Padding(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 4, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TermDef(term: "ID:", def: item.id, isLoading: isLoading,),
                const Padding(
                  padding: EdgeInsets.only(right: 38.0),
                  child: Icon(Icons.circle),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(item.state, style: Get.textTheme.titleLarge,),
            ),
            Text(item.type, style: Get.textTheme.titleSmall,),
            Wrap(
              spacing: 4.0, // gap between adjacent chips
              children: item.tags.map((e) => TagView(tag: e)).toList(),
            ),
          ],
        ),
      );


  Widget get _body {
    return Container(
      constraints: BoxConstraints(
        minHeight: Get.width / 3,
      ),
      child: Stack(
        children: [
          _more,
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CreativeImage(path: item.image,),
              ),
              Expanded(
                flex: 5,
                child: _content,
              ),
            ],
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return AdvCard(
      child: Column(
        children: [
          ShimmerLoading(
            isLoading: isLoading,
            child: _body,
          ),
        ],
      ),
    );
  }

}

import 'package:advedro/core/utils/utils.dart';
import 'package:advedro/feature/buy/buy_home/presentation/controller/buy_home_controller.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/asset_resource/images_resource.dart';
import '../../core/data/enums/app_view_enum.dart';

/// An internal data model represents each row of actions in Users Info modal view
class _Item {
  final String label;
  final IconData icon;

  const _Item(this.label, this.icon);

  static const all = [
    _Item("My Account", Icons.account_circle),
    _Item("Addons", Icons.access_alarm_outlined),
    _Item("Conversation TRK", Icons.local_convenience_store_rounded),
    _Item("FAQ & Knowledge-base", Icons.question_answer),
    _Item("Logout", Icons.logout),
  ];

}


class _ItemView extends StatelessWidget {
  final _Item item;
  const _ItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 8, bottom: 4, right: 12),
          child: Icon(
            item.icon,
            color: Get.iconColor?.withOpacity(0.5),
          ),
        ),
        Text(
          item.label,
          style: Get.textTheme.titleSmall?.copyWith(color: Get.iconColor),
        ),
      ],
    );
  }
}


/// A dialog used for show a summary of User Info,
/// also used for switching between buy and tracker modes,
/// furthermore it used for add credits to the user
class SwitcherContent extends GetView<HomeController> {
  const SwitcherContent({Key? key}) : super(key: key);

  Widget get _header => Stack(
    children: [
      Row(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 30,
              child: Image.asset(ImagesResource.vina),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome", style: Get.textTheme.titleSmall?.copyWith(color: Get.iconColor?.withOpacity(0.5))),
                  Text("Vina Mohammadi", style: Get.textTheme.titleMedium?.copyWith(color: Get.iconColor)),
                ],
              ),
            ),
          )
        ],
      ),
      Positioned(
          top: 0,
          right: 0,
          child: Badge(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            largeSize: 25,
            // backgroundColor: Colors.green,
            label: Row(
              children: [
                const Icon(Icons.verified_outlined, size: 18, color: Colors.white,),
                const SizedBox(width: 4,),
                const Text("Verified",),
              ],
            ),
          )),
    ],
  );

  Widget get _detail => Column(
    children: _Item.all.map((e) => _ItemView(item: e)).toList(),
  );



  Widget get _switcher {
    return AnimatedButtonBar(
      foregroundColor: Get.theme.primaryColorDark,
        invertedSelection: true,
        controller: AnimatedButtonController()
          ..index = controller.appView.index,
        elevation: 10,
        radius: 15,
        children: AppViewEnum.values.map((e) =>
            ButtonBarEntry(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(e.image, width: 32,),
                  const SizedBox(width: 8,),
                  Text(e.label),
                ],
              ),
              onTap: () => controller.appView = e,),
        ).toList()
    );
  }

  Widget get _availBalance => Card(
    color: Get.theme.cardColor.withOpacity(0.5),
    //elevation: 2,
    child: SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: Row(
              children: [
                Icon(Icons.wallet, color: Get.iconColor?.withOpacity(0.5)),
                const SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Available Balance", style: Get.textTheme.bodySmall,),
                    Text("\$240", style: Get.textTheme.titleLarge),
                  ],
                ),
              ],
            )),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: notImplemented,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Get.theme.primaryColorDark,
                          borderRadius: BorderRadius.circular(12)
                      ),
                        width: 40,
                        height: 40,
                        child: const Center(child: Icon(Icons.add, color: Colors.white,))),
                  ),
              ),
            )
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      child: Column(
        children: [
          _header,
          const Divider(
            height: 30,
          ),
          _availBalance,
          _detail,
          const Divider(
            height: 30,
          ),
          _switcher,
        ],
      ),
    );
  }
}

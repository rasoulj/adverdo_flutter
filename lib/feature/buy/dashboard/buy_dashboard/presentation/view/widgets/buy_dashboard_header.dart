import 'package:advedro/config/consts/consts.dart';
import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderItemData {
  final String title;
  final double amount;
  final double rate;

  const HeaderItemData({
    required this.title, 
    required this.amount, 
    required this.rate,
  });

  double get rateAmount => rate*amount/100.0;
  String get amountDisplay => amount >= 0 ? "\$${amount.toStringAsFixed(2)}" : "\$(${(-amount).toStringAsFixed(2)})";

  int get _intense => Get.isDarkMode ? 700 : 100;
  Color? get color {
    return (amount > 0 ? Colors.green : amount < 0 ? Colors.red : Colors.grey)[_intense];
  }

  IconData get amountIcon => amount > 0 ? Icons.arrow_upward : amount < 0 ? Icons.arrow_downward : Icons.minimize;
  
  static const List<HeaderItemData> all = [
    HeaderItemData(title: "Profile", amount: 12, rate: 50),
    HeaderItemData(title: "Impressions", amount: -3, rate: 34),
    HeaderItemData(title: "Conversations", amount: 0, rate: 0),
    HeaderItemData(title: "Spending", amount: 35, rate: 0),
  ];
}


class HeaderItem extends StatelessWidget {
  final HeaderItemData data;
  const HeaderItem({Key? key, required this.data}) : super(key: key);


  Widget get _rate => Row(
    children: [
      Icon(data.amountIcon, size: 14, color: Get.iconColor,),
      Text("${data.rate.toStringAsFixed(2)}% (${data.rateAmount})",
        style: Get.textTheme.labelSmall?.copyWith(color: Get.iconColor?.withOpacity(0.6)),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: AppDesigns.cardShape,
      color: data.color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data.title,
              style: Get.textTheme.titleSmall?.copyWith(color: Get.iconColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.amountDisplay,
                  style: Get.textTheme.titleMedium?.copyWith(color: Get.iconColor),
                ),
                _rate,
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BuyDashboardHeader extends StatelessWidget {
  const BuyDashboardHeader({Key? key}) : super(key: key);

  static const double _widthRatio = 0.52;

  @override
  Widget build(BuildContext context) {
    var items = HeaderItemData.all;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: Get.width*_widthRatio/2,
      child: PageView(
        padEnds: false,
        controller: PageController(viewportFraction: _widthRatio),
        // pageSnapping: false,
        children: items.map((e) => HeaderItem(data: e)).toList(),
      ),
    );
  }
}


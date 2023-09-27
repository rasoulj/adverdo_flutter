import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignTitleAndBadge extends StatelessWidget {
  const CampaignTitleAndBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '1454 Amin Campaigns Iran',
          style: Get.textTheme.bodyLarge,
        ),
        Container(
          height: 21.0,
          width: 21.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360.0),
            gradient: const RadialGradient(
              stops: [0.4, 1.0],
              colors: [Colors.red, Colors.white],
            ),
          ),
        )
      ],
    );
  }
}

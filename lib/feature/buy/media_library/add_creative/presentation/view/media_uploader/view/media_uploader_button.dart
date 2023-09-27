import 'package:advedro/config/consts/consts.dart';
import 'package:advedro/config/theme/app_designs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaUploaderButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  const MediaUploaderButton({Key? key, required this.title, required this.onPress, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: AppDesigns.getCircularBorder(side: const BorderSide(width: 0.5)),
      child: InkWell(
        onTap: onPress,
        child: SizedBox(
          height: Get.width/goldenRatio/3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_upload_outlined),
              const SizedBox(width: 20,),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}

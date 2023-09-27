import 'dart:async';

import 'package:advedro/config/theme/app_designs.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../controller/add_creative_controller.dart';
import '../media_uploader.dart';
import 'media_uploader_button.dart';
import 'media_uploader_card.dart';

class MediaUploader extends GetView<AddCreativeController> {
  final MediaTypeEnum mediaType;
  final String title;
  const MediaUploader(this.mediaType, {
    Key? key,
    this.title = "Upload Banner",
  }) : super(key: key);



  void removeMedia(MediaUploaderController c) {
    controller.removeMedia(c);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => InputDecorator(
      decoration: InputDecoration(
        errorStyle: AppDesigns.errorStyle,
        errorText: controller.getErrorText(mediaType),
      ),
      child: Column(
        children: [
          MediaUploaderButton(onPress: onUpload, title: title,),
          ...controller.getMediaControllers(mediaType).map((c) => MediaUploaderCard(
            controller: c,
            onDelete: () => removeMedia(c),
          )),
        ],
      ),
    ), );
  }

  Future<void> onUpload() async {
    try {
      var cropped = await ImageUtils.pickImageAndCrop();

      if (cropped == null) return;
      controller.addMedia(cropped.path, mediaType);
    } on PlatformException catch(e) {
      EasyLoading.showError(
        e.message ?? "Unknown error!",
        duration: 5.seconds,
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      // Get.snackbar("Error", e.toString());
    }

  }
}


import 'package:advedro/core/utils/utils.dart';
import 'package:advedro/feature/buy/media_library/add_creative/presentation/controller/add_creative_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../media_uploader.dart';

void main() {
  Get.put(AddCreativeController());
  runApp(const ExampleRunner(isDark: false, child: MediaUploaderExample()));
}

class MediaUploaderExample extends GetView<AddCreativeController> {

  const MediaUploaderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          MediaUploader(MediaTypeEnum.banner),
          Divider(height: 20,),
          MediaUploader(MediaTypeEnum.video, title: "Upload Video",),
        ],
      ),
    );
  }
}

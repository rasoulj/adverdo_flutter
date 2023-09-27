import 'package:flutter/material.dart';
import 'media_uploader/media_uploader.dart';
import 'widgets/widgets.dart';

class PushNotificationView extends AdsViewBase {
  const PushNotificationView({super.key});

  @override
  List<Widget> get bodyWidgets => const [
    TitleInput(),
    BodyInput(),
    ApplyNowInput(),
    Divider(height: 30,),
    MediaUploader(
      MediaTypeEnum.banner,
      title: "The icon should be 1:1 ratio",
    ),
    Divider(height: 20,),
    MediaUploader(
      MediaTypeEnum.video,
      title: "The image should be 2:1 ratio",
    ),
  ];

}
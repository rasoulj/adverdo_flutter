import 'package:flutter/material.dart';
import 'media_uploader/media_uploader.dart';
import 'widgets/widgets.dart';

class VideoAdsView extends AdsViewBase {
  const VideoAdsView({super.key});

  @override
  List<Widget> get bodyWidgets => const [
    TitleInput(),
    BodyInput(),
    ApplyNowInput(),
    Divider(),
    MediaUploader(
      MediaTypeEnum.banner,
      title: "Upload Image",
    ),
    Divider(height: 30,),
    MediaUploader(
      MediaTypeEnum.video,
      title: "Upload Video",
    ),
  ];

}
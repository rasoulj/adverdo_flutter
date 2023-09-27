import 'package:flutter/material.dart';
import 'media_uploader/media_uploader.dart';
import 'widgets/widgets.dart';

class NativeAdsView extends AdsViewBase {
  const NativeAdsView({super.key});

  @override
  List<Widget> get bodyWidgets => const [
    TitleInput(),
    BodyInput(),
    ApplyNowInput(),
    BrandNameInput(),
    Divider(),
    MediaUploader(MediaTypeEnum.banner),
  ];

}
import 'package:flutter/material.dart';

import 'media_uploader/media_uploader.dart';
import 'widgets/widgets.dart';


class BannerAdsView extends AdsViewBase {
  const BannerAdsView({super.key});

  @override
  List<Widget> get bodyWidgets => const [
    Divider(),
    MediaUploader(MediaTypeEnum.banner),
  ];

}
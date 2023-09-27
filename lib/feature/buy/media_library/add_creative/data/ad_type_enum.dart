
import 'package:advedro/feature/buy/media_library/add_creative/presentation/view/video_ads_view.dart';
import 'package:advedro/feature/buy/media_library/medialibrary/data/model/ad_types_enum.dart';

import '../presentation/view/banner_ads_view.dart';
import '../presentation/view/native_ads_view.dart';
import '../presentation/view/push_notification_view.dart';

const Map<AdTypesEnum, String> _titles = {
  AdTypesEnum.banner: "Banner Ads",
  AdTypesEnum.native: "Native Ads",
  AdTypesEnum.push: "Push Notification",
  AdTypesEnum.video: "Video Ads",
  AdTypesEnum.all: "None",
};

final Map<AdTypesEnum, dynamic> _tos = {
  AdTypesEnum.banner: () => const BannerAdsView(),
  AdTypesEnum.native: () => const NativeAdsView(),
  AdTypesEnum.push: () => const PushNotificationView(),
  AdTypesEnum.video: () => const VideoAdsView(),
  AdTypesEnum.all: null,
};

extension AdTypesEnumEx on AdTypesEnum {
  String get title => _titles[this] ?? "-";
  dynamic get to => _tos[this];
}

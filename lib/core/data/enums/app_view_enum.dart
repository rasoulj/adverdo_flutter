import '../../../config/asset_resource/images_resource.dart';

/// Defines App's different views
enum AppViewEnum {
  /// Used for buy side
  buy,

  /// used for tracker side
  tracker,
}

class _AppViewEnumMetaData {
  final String label;
  final String image;

  const _AppViewEnumMetaData(this.label, this.image);

  static const Map<AppViewEnum, _AppViewEnumMetaData> all = {
    AppViewEnum.buy: _AppViewEnumMetaData("Buy", ImagesResource.advedroLogo),
    AppViewEnum.tracker: _AppViewEnumMetaData("Tracker", ImagesResource.logoTracker),
  };
}

extension AppViewEnumEx on AppViewEnum {
  String get label => _AppViewEnumMetaData.all[this]!.label;
  String get image => _AppViewEnumMetaData.all[this]!.image;
}

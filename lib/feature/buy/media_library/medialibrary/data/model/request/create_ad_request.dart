import 'package:advedro/core/data/enums/method_actions_enum.dart';
import 'package:advedro/core/data/models/request_base.dart';
import 'package:advedro/core/data/types/json.dart';

import '../ad_types_enum.dart';

class _K {
  static const String title = "title";
  static const String body = "body";
  static const String callToAction = "call_to_action";
  static const String brandName = "brand_name";
  static const String tags = "tags";
  static const String images = "images";
}

class CreateAdRequest extends RequestBase {
  final AdTypesEnum adType;
  final String groupId;
  final String title;
  final String body;
  final int callToAction;
  final String brandName;
  final List<String> tags;
  final List<String> images;

  CreateAdRequest({
    required this.adType,
    required this.groupId,
    required this.title,
    required this.body,
    required this.callToAction,
    required this.brandName,
    required this.tags,
    required this.images,
  });

  @override
  MethodActionsEnum get method => MethodActionsEnum.post;

  @override
  Json get requestBody => {
        _K.title: title,
        _K.body: body,
        _K.callToAction: callToAction,
        _K.brandName: brandName,
        _K.tags: tags,
        _K.images: images,
      };

  bool get isValid => adType == AdTypesEnum.native && brandName != "";

  @override
  String get requestUrl => "/buy/medialibraries/group/$groupId/type/${adType.name}";
}

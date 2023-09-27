import 'package:advedro/core/data/enums/method_actions_enum.dart';
import 'package:advedro/core/data/models/request_base.dart';
import 'package:advedro/core/data/types/json.dart';

class _K {
  static const String tags = "tags";
}

class ChangeTagsRequest extends RequestBase {
  final List<String> tags;
  final String id;

  const ChangeTagsRequest({required this.id, required this.tags});

  @override
  MethodActionsEnum get method => MethodActionsEnum.put;

  @override
  String get requestUrl => "/buy/medialibraries/$id/change-tags";

  @override
  Json get requestBody => {
        _K.tags: tags,
      };
}

import 'package:advedro/core/data/types/json.dart';

import '../enums/method_actions_enum.dart';


abstract class RequestBase {
  const RequestBase();

  MethodActionsEnum get method => MethodActionsEnum.get;
  Json get requestBody => {};
  Json get requestQueryParameters => {};
  String get requestUrl;
}

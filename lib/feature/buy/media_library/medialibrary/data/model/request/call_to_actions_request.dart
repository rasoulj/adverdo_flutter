import 'package:advedro/core/data/models/request_base.dart';

class CallToActionsRequest extends RequestBase {
  const CallToActionsRequest();

  @override
  String get requestUrl => "/buy/medialibraries/cta";
}

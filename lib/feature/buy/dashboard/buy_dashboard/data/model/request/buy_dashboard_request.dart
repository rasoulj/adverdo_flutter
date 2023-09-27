import 'package:advedro/core/data/models/request_base.dart';

class BuyDashboardRequest extends RequestBase {
  const BuyDashboardRequest({
    required this.size,
    required this.request,
  });

  final int size;
  final int request;

  @override
  String get requestUrl => "/buy/dashboard";
}

import 'package:advedro/core/api_method/api_method.dart';
import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';

import '../model/request/buy_dashboard_request.dart';
import '../model/response/buy_dashboard_model.dart';
import 'buy_dashboard_datasource.dart';

class BuyDashboardDataSourceImpl implements BuyDashboardDataSource {
  const BuyDashboardDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<BuyDashboardModel> fetch({required BuyDashboardRequest request}) async {
    return ApiMethod<BuyDashboardRequest, BuyDashboardModel>(
      dio,
      parser: BuyDashboardModel.fromRawJson,
      request: request,
    ).call();
  }
}

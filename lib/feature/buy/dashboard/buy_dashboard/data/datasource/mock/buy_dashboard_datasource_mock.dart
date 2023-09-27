import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';
import 'package:get/get.dart';
import '../../model/request/buy_dashboard_request.dart';
import '../../model/response/buy_dashboard_model.dart';
import '../buy_dashboard_datasource.dart';
import 'model_sample1.dart';

class BuyDashboardDataSourceMock implements BuyDashboardDataSource {
  const BuyDashboardDataSourceMock({required this.dio});
  final DioClientService dio;

  @override
  Future<BuyDashboardModel> fetch({required BuyDashboardRequest request}) async {
    var model = BuyDashboardModel.fromRawJson(sampleOfBuyDashboardModel);
    await Future.delayed(3.seconds);
    return Future.value(model);
  }
}

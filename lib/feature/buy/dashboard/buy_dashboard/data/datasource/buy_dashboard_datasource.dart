
import '../model/request/buy_dashboard_request.dart';
import '../model/response/buy_dashboard_model.dart';

abstract class BuyDashboardDataSource {
  Future<BuyDashboardModel> fetch({required BuyDashboardRequest request});
}

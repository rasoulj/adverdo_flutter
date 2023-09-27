import 'package:dio/dio.dart';

import '../../../../../../config/urls/urls.dart';
import '../../../../../../core/error/http_error_actions.dart';
import '../../../../../../core/network_info/dio_client_service/dio_client_service.dart';
import '../model/request/campaign_daily_budget_request.dart';
import '../model/response/campaign_daily_budget_model.dart';
import 'campaign_daily_budget_datasource.dart';

class CampaignDailyBudgetDataSourceImpl implements CampaignDailyBudgetDataSource {
  const CampaignDailyBudgetDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<DailyBudgetCampaignModel> updateDailyBudget({required DailyBudgetCampaignRequest request}) async {
    try {
      Response response = await dio().put(Urls.campaignDailyBudgetUrl(id: request.id));
      if (response.statusCode == 200 && response.data != null) {
        return DailyBudgetCampaignModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }
}

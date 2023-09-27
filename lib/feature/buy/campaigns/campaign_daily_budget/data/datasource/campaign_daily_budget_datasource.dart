import '../model/request/campaign_daily_budget_request.dart';
import '../model/response/campaign_daily_budget_model.dart';

abstract class CampaignDailyBudgetDataSource {
  Future<DailyBudgetCampaignModel> updateDailyBudget({required DailyBudgetCampaignRequest request});
}

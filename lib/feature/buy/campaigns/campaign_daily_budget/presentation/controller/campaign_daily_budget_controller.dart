import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/data/model/request/campaign_daily_budget_request.dart';
import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/domain/usecase/daily_budget_campaign_usecase.dart';
import 'package:get/get.dart';

class CampaignDailyBudgetController extends GetxController {
  CampaignDailyBudgetController({required this.dailyBudgetCampaignUseCase});
  final CampaignDailyBudgetUseCase dailyBudgetCampaignUseCase;

  void updateDailyBudget() async {
    DailyBudgetCampaignRequest request = const DailyBudgetCampaignRequest(id: "10");
    var result = await dailyBudgetCampaignUseCase(request: request);
    result.fold(
      (failure) => null,
      (data) => null,
    );
  }
}

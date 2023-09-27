import 'package:advedro/core/error/failures.dart';
import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/data/model/request/campaign_daily_budget_request.dart';
import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/data/model/response/campaign_daily_budget_model.dart';
import 'package:dartz/dartz.dart';

abstract class CampaignDailyBudgetRepository {
  Future<Either<Failure, DailyBudgetCampaignModel>> updateDailyBudget({required DailyBudgetCampaignRequest request});
}

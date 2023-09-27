import 'package:advedro/core/error/failures.dart';
import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/data/model/request/campaign_daily_budget_request.dart';
import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/data/model/response/campaign_daily_budget_model.dart';
import 'package:dartz/dartz.dart';

import '../repository/daily_budget_campaign_repository.dart';

class CampaignDailyBudgetUseCase {
  const CampaignDailyBudgetUseCase({required this.repository});
  final CampaignDailyBudgetRepository repository;

  Future<Either<Failure, DailyBudgetCampaignModel>> call({required DailyBudgetCampaignRequest request}) async {
    var result = await repository.updateDailyBudget(request: request);
    return result;
  }
}

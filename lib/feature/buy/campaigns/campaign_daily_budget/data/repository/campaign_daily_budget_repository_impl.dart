import 'package:advedro/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/data/model/response/campaign_daily_budget_model.dart';

import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/data/model/request/campaign_daily_budget_request.dart';

import 'package:advedro/core/error/failures.dart';

import '../../domain/repository/daily_budget_campaign_repository.dart';
import '../datasource/campaign_daily_budget_datasource.dart';

class CampaignDailyBudgetRepositoryImpl implements CampaignDailyBudgetRepository {
  const CampaignDailyBudgetRepositoryImpl({required this.dataSource});
  final CampaignDailyBudgetDataSource dataSource;

  @override
  Future<Either<Failure, DailyBudgetCampaignModel>> updateDailyBudget({required DailyBudgetCampaignRequest request}) async {
    try {
      var result = await dataSource.updateDailyBudget(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

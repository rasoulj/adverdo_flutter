import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/data/datasource/campaign_daily_budget_datasource_impl.dart';
import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/domain/repository/daily_budget_campaign_repository.dart';
import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/domain/usecase/daily_budget_campaign_usecase.dart';
import 'package:advedro/feature/buy/campaigns/campaign_daily_budget/presentation/controller/campaign_daily_budget_controller.dart';
import 'package:get/get.dart';

import '../../data/datasource/campaign_daily_budget_datasource.dart';
import '../../data/repository/campaign_daily_budget_repository_impl.dart';

class DailyBudgetCampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CampaignDailyBudgetDataSource>(() => CampaignDailyBudgetDataSourceImpl(dio: Get.find()));
    Get.lazyPut<CampaignDailyBudgetRepository>(() => CampaignDailyBudgetRepositoryImpl(dataSource: Get.find()));
    Get.lazyPut(() => CampaignDailyBudgetUseCase(repository: Get.find()));
    Get.lazyPut(() => CampaignDailyBudgetController(dailyBudgetCampaignUseCase: Get.find()));
  }
}

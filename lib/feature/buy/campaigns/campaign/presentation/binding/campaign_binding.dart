import 'package:advedro/feature/buy/campaigns/campaign/domain/usecase/delete_campaign_usecase.dart';
import 'package:advedro/feature/buy/campaigns/campaign/domain/usecase/edit_campaign_usecase.dart';

import '../../data/datasource/campaign_datasource.dart';
import '../../data/datasource/campaign_datasource_impl.dart';
import '../../data/repository/campaign_repository_impl.dart';
import '../../domain/repository/campaign_repository.dart';
import '../../domain/usecase/campiagn_usecase.dart';
import '../../domain/usecase/create_campaign_usecase.dart';
import '../controller/campaign_controller.dart';
import 'package:get/get.dart';

class CampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CampaignDataSource>(() => CampaignDataSourceImpl(dio: Get.find()));
    Get.lazyPut<CampaignRepository>(() => CampaignRepositoryImpl(dataSource: Get.find()));
    // usecase
    Get.lazyPut(() => CampaignUseCase(repository: Get.find()));
    Get.lazyPut(() => CreateCampaignUseCase(repository: Get.find()));
    Get.lazyPut(() => EditCampaignUseCase(repository: Get.find()));
    Get.lazyPut(() => DeleteCampaignUseCase(repository: Get.find()));
    // controller
    Get.lazyPut(
      () => CampaignController(
        campaignUseCase: Get.find(),
        createCampaignUseCase: Get.find(),
        editCampaignUseCase: Get.find(),
        deleteCampaignUseCase: Get.find(),
      ),
    );
  }
}

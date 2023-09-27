import 'package:get/get.dart';
import '../../data/datasource/target_campaign_datasource.dart';
import '../../data/datasource/target_campaign_datasource_impl.dart';
import '../../data/repository/target_campaign_repository_impl.dart';
import '../../domain/repository/target_campaign_repository.dart';
import '../../domain/usecase/target_campaign_usecase.dart';
import '../controller/target_campaign_controller.dart';

class TargetCampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TargetCampaignDataSource>(() => TargetCampaignDataSourceImpl(dio: Get.find()));
    Get.lazyPut<TargetCampaignRepository>(() => TargetCampaignRepositoryImpl(dataSource: Get.find()));
    Get.lazyPut(() => TargetCampaignUseCase(repository: Get.find()));
    Get.lazyPut(() => TargetCampaignController(targetCampaignUseCase: Get.find()));
  }
}

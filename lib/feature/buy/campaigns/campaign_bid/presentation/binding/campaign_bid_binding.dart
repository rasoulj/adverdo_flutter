import '../../data/datasource/campaign_bid_datasource.dart';
import '../../data/datasource/campaign_bid_datasource_impl.dart';
import '../../data/repository/campaign_bid_repository_impl.dart';
import '../../domain/repository/campaign_bid_repository.dart';
import '../../domain/usecase/campaign_bid_usecase.dart';
import '../controller/campaign_bid_controller.dart';
import 'package:get/get.dart';

class CampaignBidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CampaignBidDataSource>(() => CampaignBidDataSourceImpl(dio: Get.find()));
    Get.lazyPut<CampaignBidRepository>(() => CampaignBidRepositoryImpl(dataSource: Get.find()));
    Get.lazyPut(() => CampaignBidUseCase(repository: Get.find()));
    Get.lazyPut(() => CampaignBidController(campaignBidUseCase: Get.find()));
  }
}

import 'package:get/get.dart';
import '../../feature/buy/buy_home/presentation/controller/buy_home_controller.dart';
import '../../feature/buy/campaigns/campaign/presentation/binding/campaign_binding.dart';
import '../../feature/buy/dashboard/buy_dashboard/presentation/binding/buy_dashboard_binding.dart';
import '../../feature/buy/media_library/media_groups/presentation/binding/media_groups_binding.dart';
import '../../feature/buy/temp/presentation/controller/app_settings_controller.dart';
import '../../feature/buy/temp/presentation/controller/temp_controller.dart';
import '../network_info/dio_client_service/dio_client_service.dart';

class DependencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DioClientService());
    Get.put(HomeController());
    Get.lazyPut(() => AppSettingsController());
    Get.lazyPut(() => TempController());
    MediaGroupsBinding().dependencies();
    BuyDashboardBinding().dependencies();
    CampaignBinding().dependencies();
  }
}

import 'package:get/get.dart';

import '../../data/datasource/buy_dashboard_datasource.dart';
import '../../data/datasource/mock/buy_dashboard_datasource_mock.dart';
import '../../data/repository/buy_dashboard_repository_impl.dart';
import '../../domain/repository/buy_dashboard_repository.dart';
import '../../domain/usecase/buy_dashboard_usecase.dart';
import '../controller/buy_dashboard_controller.dart';

class BuyDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyDashboardDataSource>(() => BuyDashboardDataSourceMock(dio: Get.find()));
    Get.lazyPut<BuyDashboardRepository>(() => BuyDashboardRepositoryImpl(dataSource: Get.find()));
    Get.lazyPut(() => BuyDashboardUseCase(repository: Get.find()));
    Get.lazyPut(() => BuyDashboardController(useCase: Get.find()));
  }
}

import 'package:get/get.dart';

import '../../data/datasource/account_detail_datasource.dart';
import '../../data/datasource/account_detail_datasource_impl.dart';
import '../../data/repository/account_detail_repository_impl.dart';
import '../../domain/repository/account_detail_repository.dart';
import '../../domain/usecase/account_detail_usecase.dart';
import '../controller/account_detail_controller.dart';

class AccountDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountDetailDataSource>(() => AccountDetailDataSourceImpl(dio: Get.find()));
    Get.lazyPut<AccountDetailRepository>(() => AccountDetailRepositoryImpl(dataSource: Get.find()));
    Get.lazyPut(() => AccountDetailUseCase(repository: Get.find()));
    Get.lazyPut(() => AccountDetailController(useCase: Get.find()));
  }
}

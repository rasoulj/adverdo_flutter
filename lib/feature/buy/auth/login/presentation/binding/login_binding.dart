import 'package:get/get.dart';

import '../../data/datasource/login_datasource.dart';
import '../../data/datasource/login_datasource_impl.dart';
import '../../data/repository/login_repository_impl.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/usecase/login_usecase.dart';
import '../controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginDataSource>(() => LoginDataSourceImpl(dio: Get.find()));
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(dataSource: Get.find()));
    Get.lazyPut(() => LoginUseCase(repository: Get.find()));
    Get.lazyPut(() => LoginController(useCase: Get.find()));
  }
}

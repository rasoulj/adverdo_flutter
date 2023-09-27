import 'package:get/get.dart';

import '../../data/datasource/change_password_datasource.dart';
import '../../data/datasource/change_password_datasource_impl.dart';
import '../../data/repository/change_password_repository_impl.dart';
import '../../domain/repository/change_password_repository.dart';
import '../../domain/usecase/change_password_usecase.dart';
import '../controller/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordDataSource>(() => ChangePasswordDataSourceImpl(dio: Get.find()));
    Get.lazyPut<ChangePasswordRepository>(() => ChangePasswordRepositoryImpl(dataSource: Get.find()));
    Get.lazyPut(() => ChangePasswordUseCase(repository: Get.find()));
    Get.lazyPut(() => ChangePasswordController(useCase: Get.find()));
  }
}

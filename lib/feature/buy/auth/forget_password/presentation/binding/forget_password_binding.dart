import 'package:advedro/feature/buy/auth/forget_password/data/datasource/forget_password_datasource.dart';
import 'package:advedro/feature/buy/auth/forget_password/data/datasource/forget_password_datasource_impl.dart';
import 'package:advedro/feature/buy/auth/forget_password/data/repository/forget_password_repository_impl.dart';
import 'package:advedro/feature/buy/auth/forget_password/domain/repository/forget_password_repository.dart';
import 'package:advedro/feature/buy/auth/forget_password/domain/usecase/forget_password_send_email_usecase.dart';
import 'package:advedro/feature/buy/auth/forget_password/presentation/controller/forget_password_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordDataSource>(() => ForgetPasswordDataSourceImpl(dio: Get.find()));
    Get.lazyPut<ForgetPasswordRepository>(() => ForgetPasswordRepositoryImpl(dataSource: Get.find()));
    Get.lazyPut(() => ForgetPasswordUseCase(repository: Get.find()));
    Get.lazyPut(() => ForgetPasswordController(forgetPasswordUseCase: Get.find()));
  }
}

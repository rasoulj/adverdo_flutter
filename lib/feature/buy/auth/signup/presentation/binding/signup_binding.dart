import 'package:advedro/feature/buy/auth/signup/domain/usecase/resend_verification_code_usecase.dart';

import '../../data/datasource/signup_datasource.dart';
import '../../data/datasource/signup_datasource_impl.dart';
import '../../data/repository/signup_repository_impl.dart';
import '../../domain/repository/signup_repository.dart';
import '../../domain/usecase/get_verification_code_usecase.dart';
import '../../domain/usecase/signup_usecase.dart';
import '../controller/verification_controller.dart';
import '../controller/signup_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpDataSource>(() => SignUpDataSourceImpl(dio: Get.find()));
    Get.lazyPut<SignUpRepository>(() => SignUpRepositoryImpl(dataSource: Get.find()));
    // usecase
    Get.lazyPut(() => GetVerificationCodeUseCase(repository: Get.find()));
    Get.lazyPut(() => SignUpUseCase(repository: Get.find()));
    Get.lazyPut(() => ResendVerificationCodeUseCase(repository: Get.find()));
    // controllers
    Get.lazyPut(() => SignUpController(signUpUseCase: Get.find()));
    Get.lazyPut(
      () => VerificationController(
        getVerificationCodeUseCase: Get.find(),
        resendVerificationCodeUseCase: Get.find(),
      ),
    );
  }
}

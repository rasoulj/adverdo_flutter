import 'package:get/get.dart';

import '../../data/datasource/medialibraries_datasource.dart';
import '../../data/datasource/mock/medialibraries_datasource_mock.dart';
import '../../data/repository/medialibraries_repository_impl.dart';
import '../../domain/repository/medialibraries_repository.dart';
import '../../domain/usecase/medialibraries_usecase.dart';
import '../controller/medialibraries_controller.dart';

class MediaLibrariesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaLibrariesDataSource>(() => MediaLibrariesDataSourceMock(dio: Get.find()));
    Get.lazyPut<MediaLibrariesRepository>(() => MediaLibrariesRepositoryImpl(dataSource: Get.find()));
    Get.lazyPut(() => MediaLibrariesUseCase(repository: Get.find()));
    Get.lazyPut(() => MediaLibrariesController(useCase: Get.find()));
  }
}

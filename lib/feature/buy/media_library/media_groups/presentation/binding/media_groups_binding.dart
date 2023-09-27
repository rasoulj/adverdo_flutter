import 'package:get/get.dart';

import '../../data/datasource/media_groups_datasource.dart';
import '../../data/datasource/mock/media_groups_datasource_mock.dart';
import '../../data/repository/media_groups_repository_impl.dart';
import '../../domain/repository/media_groups_repository.dart';
import '../../domain/usecase/media_groups_usecase.dart';
import '../controller/media_groups_controller.dart';

class MediaGroupsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaGroupsDataSource>(() => MediaGroupsDataSourceMock(dio: Get.find()));
    Get.lazyPut<MediaGroupsRepository>(() => MediaGroupsRepositoryImpl(dataSource: Get.find()));
    Get.lazyPut(() => MediaGroupsUseCase(repository: Get.find()));
    Get.lazyPut(() => MediaGroupsController(useCase: Get.find()));
  }
}

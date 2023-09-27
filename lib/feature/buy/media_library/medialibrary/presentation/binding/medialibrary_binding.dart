import 'package:get/get.dart';

import '../../data/datasource/medialibrary_datasource.dart';
import '../../data/datasource/mock/medialibrary_datasource_mock.dart';
import '../../data/repository/medialibrary_repository_impl.dart';
import '../../domain/repository/medialibrary_repository.dart';
import '../../domain/usecase/usecase.dart';
import '../controller/medialibrary_controller.dart';

class MediaLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaLibraryDataSource>(() => MediaLibraryDataSourceMock(dio: Get.find()));
    Get.lazyPut<MediaLibraryRepository>(() => MediaLibraryRepositoryImpl(dataSource: Get.find()));

    Get.lazyPut(() => FetchMediaLibraryUseCase(repository: Get.find()));
    Get.lazyPut(() => CreateAdUseCase(repository: Get.find()));

    Get.lazyPut(() => MediaLibraryController(
          getMediaLibraryUseCase: Get.find(),
          createAdUseCase: Get.find(),
        ));
  }
}

import 'package:get/get.dart';

import '../../data/model/request/request.dart';
import '../../data/model/response/response.dart';
import '../../domain/usecase/usecase.dart';
import '../validator/medialibrary_validator.dart';

class MediaLibraryController extends GetxController with MediaLibraryValidator, StateMixin<MediaLibraryModel> {
  MediaLibraryController({
    required this.createAdUseCase,
    required this.getMediaLibraryUseCase,
  });

  final FetchMediaLibraryUseCase getMediaLibraryUseCase;
  final CreateAdUseCase createAdUseCase;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  void fetch() async {
    var args = Get.arguments as Creative;

    MediaLibraryRequest request = MediaLibraryRequest(
      id: args.id,
    );

    change(null, status: RxStatus.loading());

    var result = await getMediaLibraryUseCase(request: request);

    result.fold(
      (failure) => change(null, status: RxStatus.error("Error loading media libraries")),
      (data) {
        change(data, status: RxStatus.success());
      },
    );
  }
}

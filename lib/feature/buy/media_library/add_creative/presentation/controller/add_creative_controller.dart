
import 'package:advedro/core/utils/utils.dart';
import 'package:get/get.dart';

import 'media_uploader_controllers.dart';
import 'text_editing_controllers.dart';

class AddCreativeController extends GetxController with TextEditingControllers, MediaUploaderControllers {


  bool validate() =>
      [
        validateMediaUploaderControllers(),
        validateTextEditingControllers(),
      ].fold(true, (s, e) => s && e);

  void create() {
    bool isValid = validate();

    if (isValid) {
      notImplemented();
    } else {
      Get.snackbar("ERROR", "An error occurred");
    }
  }


  @override
  void dispose() {
    disposeMediaUploaderControllers();
    disposeTextEditingControllers();

    super.dispose();
  }


  void clear() {
    clearTextEditingControllers();
    clearMediaUploaderControllers();
  }
}

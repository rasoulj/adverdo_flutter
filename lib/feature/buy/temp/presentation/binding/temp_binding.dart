import 'package:get/get.dart';

import '../controller/app_settings_controller.dart';
import '../controller/temp_controller.dart';

class TempBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TempController());
    Get.put(AppSettingsController());
  }
}

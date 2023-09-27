import 'package:advedro/feature/buy/media_library/add_creative/presentation/controller/add_creative_controller.dart';
import 'package:get/get.dart';

class AddCreativeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCreativeController());
  }

}
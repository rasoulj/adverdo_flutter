import 'package:advedro/core/data/enums/app_view_enum.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //buyTabIndex
  final Rx<int> _buyTabIndex = 0.obs;
  set buyTabIndex(int value) {
    _buyTabIndex.value = value;
    Get.forceAppUpdate();
  }

  int get buyTabIndex => _buyTabIndex.value;

  //trackerTabIndex
  final Rx<int> _trackerTabIndex = 0.obs;
  set trackerTabIndex(int value) {
    _trackerTabIndex.value = value;
    Get.forceAppUpdate();
  }

  int get trackerTabIndex => _trackerTabIndex.value;

  //AppView
  final Rx<AppViewEnum> _appView = AppViewEnum.buy.obs;
  set appView(AppViewEnum value) {
    _appView.value = value;

    // _appView.refresh();
    update();
    Get.forceAppUpdate();
  }

  AppViewEnum get appView => _appView.value;
  bool get isBuy => appView == AppViewEnum.buy;

  void switchApp() {
    appView = isBuy ? AppViewEnum.tracker : AppViewEnum.buy;
  }

  HomeController();
}

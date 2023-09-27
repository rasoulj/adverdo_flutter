import 'package:advedro/common/common.dart';
import 'package:advedro/core/utils/dev_utils/not_implemented.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/routes_management/buy_routes_management/buy_routes.dart';
import '../../../../../../core/utils/image_utils/image_utils.dart';
import '../../controller/app_settings_controller.dart';
import 'test_chart.dart';

String? validatePassword(String? val) {
  final value = val ?? "";
  if (!(value.length > 5) && value.isNotEmpty) {
    return "Password should contain more than 5 characters";
  }
  return null;
}

class TestPage1Controller extends GetxController {
  final _value = 0.0.obs;
  double get value => _value.value;
  set value(double val) => _value.value = val;

  final _text = "".obs;
  String get text => _text.value;
  set text(String val) => _text.value = val;
}

class TestPage1 extends StatelessWidget {
  const TestPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppSettingsController>();
    // var cnt1 = TestPage1Controller();

    return Scaffold(
      appBar: AppBar(
        title: Text("Test".tr),
        actions: const [AppSwitcherIcon()],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const CardListItem(isLoading: true,),
            const ZeroWidget(),

            Center(child: ElevatedButton(onPressed: openMediaLibrary, child: const Text("Open Media Library"))),
            Center(child: ElevatedButton(onPressed: openPicker, child: const Text("Open Picker"))),

            const TestChart(),
            ElevatedButton(
              child: const Text('Change Theme'),
              onPressed: () {
                Get.isDarkMode ? Get.changeThemeMode(ThemeMode.light) : Get.changeThemeMode(ThemeMode.dark);
              },
            ),

            Obx(() => Text(controller.darkMode ? "Dark Mode" : "Light Mode")),
            ElevatedButton(
              onPressed: () {
                controller.darkMode = !controller.darkMode;
                // refresh(context);;
              },
              child: const Text("Alter Mode"),
            ),
            ElevatedButton(
              onPressed: () {
                //ChangePasswordErrors errors = ChangePasswordErrors.findErrors(currentPassword: "123456", newPassword: "123456", confirmPassword: "123456");
                //print(errors);

                // refresh(context);;
              },
              child: const Text("Test Change password validator"),
            ),
          ],
        ),
      ),
    );
  }

  void refresh(BuildContext context) {
    (context as Element).markNeedsBuild();
  }

  void openPicker() async {
    await ImageUtils.pickImageAndCrop();
  }

  void openMediaLibrary() {
    notImplemented();
    //Get.toNamed(BuyRoutes.mediaLibraries);
  }
}

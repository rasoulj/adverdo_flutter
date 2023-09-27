import 'package:advedro/config/language/language_key.dart';
import 'package:advedro/config/notification/local_notification.dart';
import 'package:advedro/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controller/temp_controller.dart';

class TestPage2 extends GetView<TempController> {
  const TestPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKeys.language.tr),
        actions: const [AppSwitcherIcon()],
      ),
      body: Center(
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: Get.width,
                  child: Text(LanguageKeys.language.tr),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.amber,
                    child: const Text('English'),
                    onPressed: () => Get.updateLocale(const Locale("en", "US")),
                  ),
                  const SizedBox(width: 100.0),
                  ElevatedButton(
                    child: const Text('Farsi'),
                    onPressed: () => Get.updateLocale(const Locale("ur", "PK")),
                  ),
                ],
              ),
              ElevatedButton(
                child: const Text('Change Theme'),
                onPressed: () {
                  Get.isDarkMode ? Get.changeThemeMode(ThemeMode.light) : Get.changeThemeMode(ThemeMode.dark);
                },
              ),
              Expanded(
                child: controller.videoPlayerController.value.value.isInitialized ? VideoPlayer(controller.videoPlayerController.value) : const Text('we had nothing to show '),
              ),
              Center(
                child: IconButton(
                  onPressed: () {
                    if (controller.videoPlayerController.value.value.isPlaying) {
                      controller.videoPlayerController.value.pause();
                    } else {
                      controller.videoPlayerController.value.play();
                    }
                  },
                  icon: const Icon(Icons.play_arrow),
                ),
              ),
              Center(
                child: MaterialButton(
                  onPressed: () async {
                    await LocalNotifications.showNotification(
                      title: 'Advedro',
                      body: 'Farhad added this title for test',
                    );
                  },
                  child: const Text('Show Notification'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

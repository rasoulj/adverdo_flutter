import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static Future initializer(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var android = const AndroidInitializationSettings("mipmap/ic_launcher");
    var ios = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android: android, iOS: ios);
    return await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNotification({required String title, required String body}) async {
    var android = const AndroidNotificationDetails(
      "advedro",
      "channelName",
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    var notification = NotificationDetails(android: android, iOS: const DarwinNotificationDetails());
    await FlutterLocalNotificationsPlugin().show(1, title, body, notification);
  }
}

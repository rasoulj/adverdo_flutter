import 'package:advedro/core/utils/easy_loading_helper/easy_loading_helper.dart';

import 'config/notification/local_notification.dart';
import 'core/dependency/dependency.dart';
import 'config/routes_management/buy_routes_management/buy_pages_management.dart';
import 'package:advedro/config/routes_management/buy_routes_management/buy_routes.dart';
import 'package:advedro/core/utils/token_manager/token_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'config/language/language.dart';
import 'config/theme/theme.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with TokenManager {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Advedro",
      debugShowCheckedModeBanner: false,
      translations: Language(),
      themeMode: ThemeMode.system,
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: BuyPages.pages,
      // initialRoute: hasToken() ? BuyRoutes.dashboard : BuyRoutes.forgetPassword,
      // initialRoute: hasToken() ? BuyRoutes.dashboard : BuyRoutes.loginOrSignUp,
      initialRoute: BuyRoutes.home,
      initialBinding: DependencyBinding(),
      builder: EasyLoadingHelper.init(),
      onReady: EasyLoadingHelper.initEasyLoading,
      onInit: () => LocalNotifications.initializer(flutterLocalNotificationsPlugin),
    );
  }
}

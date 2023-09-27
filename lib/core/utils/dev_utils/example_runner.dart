import 'package:advedro/config/language/language.dart';
import 'package:advedro/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleRunner extends StatelessWidget  {
  final Widget child;
  final bool isDark;
  final String title;
  const ExampleRunner({
    super.key,
    required this.child,
    required this.isDark,
    this.title = "Example",
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Example",
      debugShowCheckedModeBanner: false,
      translations: Language(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      home: Scaffold(
        appBar: AppBar(title: Text(title),),
        body: child,
      ),
      // getPages: BuyPages.pages,
      // initialRoute: hasToken() ? BuyRoutes.dashboard : BuyRoutes.loginOrSignUp,
      // initialRoute: BuyRoutes.temp,
      // initialRoute: BuyRoutes.home,
      // initialBinding: DependencyBinding(),
      // onInit: () => LocalNotifications.initialzer(flutterLocalNotificationsPlugin),
    );
  }
}


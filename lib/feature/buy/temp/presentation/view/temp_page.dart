import 'package:advedro/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test_page1/test_page1.dart';
import 'test_page2.dart';

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temp Page"),
        actions: const [AppSwitcherIcon()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Get.to(() => const TestPage1()),
              child: const Text("Rasoul's Test"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => const TestPage2()),
              child: const Text("Farhad's Test"),
            ),
          ],
        ),
      ),
    );
  }
}

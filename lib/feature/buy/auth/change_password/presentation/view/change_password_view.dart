import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('change_password')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.currentController,
              decoration: const InputDecoration(label: Text('UserName')),
            ),
            const SizedBox(height: 50.0),
            TextField(
              controller: controller.confirmController,
              decoration: const InputDecoration(label: Text('Password')),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: controller.changePassword,
              child: const Text('change_password'),
            )
          ],
        ),
      ),
    );
  }
}

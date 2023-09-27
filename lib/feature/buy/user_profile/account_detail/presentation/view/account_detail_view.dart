import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/account_detail_controller.dart';

class AccountDetailView extends GetView<AccountDetailController> {
  const AccountDetailView({super.key});

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
              controller: controller.firstNameController,
              decoration: const InputDecoration(label: Text('UserName')),
            ),
            const SizedBox(height: 50.0),
            TextField(
              controller: controller.lastNameController,
              decoration: const InputDecoration(label: Text('Password')),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: controller.save,
              child: const Text('change_password'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:advedro/common/common.dart';
import 'package:advedro/config/consts/consts.dart';
import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More"),
        actions: const [AppSwitcherIcon()],
      ),
      body: const Center(
        child: Text("App. Version: $appVersion"),
      ),
    );
  }
}

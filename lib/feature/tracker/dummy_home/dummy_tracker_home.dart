import 'package:advedro/common/common.dart';
import 'package:flutter/material.dart';

class DummyTrackerHome extends StatelessWidget {
  const DummyTrackerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracker Dummy Page!"),
        actions: const [AppSwitcherIcon()],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../buy/buy_home/presentation/controller/buy_home_controller.dart';
import '../buy/buy_home/presentation/view/buy_home_view.dart';
import '../tracker/dummy_home/dummy_tracker_home.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => controller.isBuy ? const BuyHomeView() : const DummyTrackerHome();
}

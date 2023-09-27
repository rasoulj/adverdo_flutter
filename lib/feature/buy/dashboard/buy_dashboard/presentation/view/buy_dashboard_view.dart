import 'package:advedro/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../config/routes_management/buy_routes_management/buy_routes.dart';
import '../../../../temp/presentation/view/test_page1/test_chart.dart';
import '../../data/model/response/buy_dashboard_model.dart';
import '../controller/buy_dashboard_controller.dart';
import 'widgets/buy_dashboard_header.dart';
import 'widgets/chat_type_selector.dart';

class MediaLibraryItemView extends StatelessWidget {
  final MediaLibraryItem item;
  final bool isLoading;
  const MediaLibraryItemView({Key? key, required this.item, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: isLoading
          ? ListTile(
              title: const ShimmerBox(height: 20, width: 3),
              leading: ShimmerBox.circle(),
              subtitle: const ShimmerBox(height: 10, width: 20),
              trailing: const ShimmerBox(height: 20, width: 20),
            )
          : ListTile(
              onTap: () => Get.toNamed(BuyRoutes.mediaLibrary, arguments: item),
              title: Text(item.name),
              leading: const Icon(Icons.perm_media_outlined),
              subtitle: Text(item.status.name),
              trailing: Text("ID: ${item.id}"),
            ),
    );
  }
}

class BuyDashboardView extends GetView<BuyDashboardController> {
  const BuyDashboardView({super.key});

  get _onLoading {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return MediaLibraryItemView(item: MediaLibraryItem.empty(), isLoading: true);
      },
      itemCount: 40,
    );
  }

  Widget _onError(String? err)  => NoData(
    icon: Icons.error_outline,
    title: err ?? "An error occurred while loading data",
    subtitle: "Try reloading data",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [AppSwitcherIcon()],
      ),
      body: Shimmer(
        child: controller.obx(
          _buildSuccess,
          onLoading: _onLoading,
          onError: _onError,
        ),
      ),
    );
  }

  Widget _buildSuccess(BuyDashboardModel? state) {
    // var items = state?.items ?? [];

    return SingleChildScrollView(
      child: Column(
        children: [
          const BuyDashboardHeader(),
          const Divider(),
          const TestChart(),
          ChartTypeSelector(
            value: controller.chartType,
            onChanged: controller.setChartType,
          ),
          const Divider(),
          const DashboardTitle(
            title: 'Campaigns',
          ),
        ],
      ),
    );
  }
}

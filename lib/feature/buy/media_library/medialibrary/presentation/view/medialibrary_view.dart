import 'package:advedro/common/common.dart';
import 'package:advedro/feature/buy/media_library/medialibrary/data/model/response/response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/medialibrary_controller.dart';

class _ItemView extends StatelessWidget {
  const _ItemView({Key? key, required this.isLoading, required this.title, required this.value, required this.icon}) : super(key: key);

  final bool isLoading;
  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? ListTile(
            title: const ShimmerBox(height: 20, width: 3),
            leading: ShimmerBox.circle(),
            subtitle: const ShimmerBox(height: 10, width: 20),
            // trailing: const ShimmerBox(height: 20, width: 20),
          )
        : ListTile(
            title: Text(title),
            leading: Icon(icon),
            subtitle: Text(value),
            // trailing: const ShimmerBox(height: 20, width: 20),
          );
  }
}

class _CreativeView extends StatelessWidget {
  const _CreativeView({Key? key, required this.item, required this.isLoading}) : super(key: key);

  final Creative item;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Get.theme.primaryColorLight,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Column(
          children: [
            _ItemView(isLoading: isLoading, title: "State", value: item.state, icon: Icons.book_outlined),
            _ItemView(isLoading: isLoading, title: "ID", value: item.id, icon: Icons.access_alarms_sharp),
            _ItemView(isLoading: isLoading, title: "Type", value: item.type, icon: Icons.add_box_sharp),
            _ItemView(isLoading: isLoading, title: "Tags", value: item.tags.join(", "), icon: Icons.tag),
          ],
        ),
      ),
    );
  }
}

class _DetailView extends StatelessWidget {
  const _DetailView({Key? key, required this.model, required this.isLoading}) : super(key: key);

  final MediaLibraryModel model;
  final bool isLoading;

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Get.theme.hintColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        children: [
          const Text("Main Panel"),
          _ItemView(isLoading: isLoading, title: "Name", value: model.name, icon: Icons.ac_unit),
          _ItemView(isLoading: isLoading, title: "ID", value: model.id, icon: Icons.ac_unit),
          _ItemView(isLoading: isLoading, title: "Status", value: model.status, icon: Icons.ac_unit),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          _buildHeader(context),
          const SizedBox(
            height: 10,
          ),
          const Text("Creatives:"),
          ...model.creatives.map((e) => _CreativeView(item: e, isLoading: isLoading)),
        ],
      ),
    );
  }
}

class MediaLibraryView extends GetView<MediaLibraryController> {
  const MediaLibraryView({super.key});

  get _onLoading {
    return _DetailView(model: MediaLibraryModel.empty(), isLoading: true);
  }

  Widget _onError(String? err)  => NoData(
    icon: Icons.error_outline,
    title: err ?? "An error occurred while loading data",
    subtitle: "Try reloading data",
  );


  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as MediaLibraryItem;

    final args = Get.arguments as Creative;

    return Scaffold(
      appBar: AppBar(title: Text('MediaLibrary: ${args.id}')),
      body: Shimmer(
        child: controller.obx(
          _buildSuccess,
          onLoading: _onLoading,
          onError: _onError,
        ),
      ),
    );
  }

  Widget _buildSuccess(MediaLibraryModel? state) {
    return _DetailView(
      model: state ?? MediaLibraryModel.empty(),
      isLoading: false,
    );
  }
}

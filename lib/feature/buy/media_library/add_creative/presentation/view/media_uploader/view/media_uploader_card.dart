import 'dart:io';

import 'package:advedro/common/common.dart';
import 'package:advedro/config/consts/consts.dart';
import 'package:advedro/config/theme/app_designs.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:path/path.dart';

import '../media_uploader.dart';


class MediaUploaderCard extends StatelessWidget {

  final MediaUploaderController controller;
  final VoidCallback onDelete;

  const MediaUploaderCard({super.key, required this.controller, required this.onDelete});

  Widget get _body =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _progressBar,
          _clearButton
        ],
      );

  Widget get _progressBar =>
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: SizedBox(
                height: 12,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppDesigns.defaultRadius),
                  child: LinearProgressIndicator(
                    color: controller.status.color?.withLightness(0.3),
                    minHeight: 3,
                    value: controller.progress,
                    backgroundColor: Colors.transparent.withOpacity(0.2),
                  ),
                ),
              ),
            ),

            _progressText,
          ],
        ),
      );

  Widget get _progressText => Text(controller.percent, style: TextStyle(color: controller.status.color?.withLightness(0.3)));

  void onRemoveMedia() async {
    bool resp = await Ask.question("Are you sure to delete this item?") ?? false;
    if (!resp) return;
    onDelete();
  }

  Widget get _clearButton {
    bool done = controller.status == UploadStatus.done;
    return SizedBox(
      width: 30,
      child: InkWell(
        onTap: done ? null : onRemoveMedia,
        child: Icon(
          done ? Icons.check : Icons.clear,
          size: 16,
        ),
      ),
    );
  }

  Widget get _deleteButton {
    bool done = controller.status == UploadStatus.done;
    return SizedBox(
      width: 30,
      child: InkWell(
        onTap: !done ? null : onRemoveMedia,
        child: Icon(
          done ? Icons.delete_forever : null,
          color: Get.theme.colorScheme.error,
          //size: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final color = controller.status.color;
      final bColor = color?.withLightness();
      final dColor = color?.withLightness(0.3);
      return Column(
        children: [
          Card(
            shape: AppDesigns.getCircularBorder(side: color == null ? BorderSide.none : BorderSide(color: color, width: 2)),
            color: bColor,
            child: SizedBox(
              height: Get.width / goldenRatio / 3,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ImageThumbnail(image: FileImage(File(controller.fileName))), // Image.file(File(controller.fileName)),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.file_present, color: dColor,),
                                  const SizedBox(width: 8,),
                                  Text(basename(controller.fileName).trimMiddle(), style: TextStyle(color: dColor),),
                                ],
                              ),
                            ),

                            _deleteButton,
                          ],
                        ),
                        _body,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if(controller.hasError) Card(
            shape: AppDesigns.getCircularBorder(radius: 5),
            color: bColor,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              child: Column(
                children: controller
                    .errorsText
                    .map((e) => Text(e, style: TextStyle(color: dColor),),)
                    .toList(),
              ),
            ),),
        ],
      );
    });
  }

}
import 'package:advedro/common/common.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiSelect<T> {
  final Widget Function(T)? iconBuilder;
  final List<T> items;
  final Set<T> selected;
  final bool hasCancel;
  final Widget? message;
  final Widget? title;
  final String Function(T)? toTitle;

  MultiSelect(this.items,
      {
        this.selected = const {},
        this.iconBuilder,
        this.hasCancel = true,
        this.message,
        this.title,
        this.toTitle,
      });


  Future<T?> call() async {
    String Function(T) tot = toTitle ?? (T e) => e.toString().camelToSentence();

    return await showCupertinoModalPopup<T>(
      context: Get.context!,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: title,
          message: message,
          actions: items.map((e) =>
              CupertinoActionSheetAction(
                onPressed: () => Get.back(result: e),
                child: Row3(
                    child1: iconBuilder != null ? iconBuilder!(e) : null,
                    child2: Text(tot(e)),
                    child3: selected.contains(e) ? const Icon(Icons.check) : const Icon(null)
                ),
              )).toList(),
          cancelButton: !hasCancel ? null : CupertinoActionSheetAction(
            onPressed: () => Get.back<int>(result: null),
            child: const Text(
              "Cancel",
            ),
          ),
        );
      },
    );
  }

}
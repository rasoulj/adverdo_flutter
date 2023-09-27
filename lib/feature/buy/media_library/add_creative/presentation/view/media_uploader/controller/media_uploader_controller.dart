import 'dart:io';
import 'dart:math' as math;

import 'package:advedro/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UploadStatus {
  none,
  uploading,
  error,
  done,
}

Map<UploadStatus, Color?> _colors = {
  UploadStatus.none: null,
  UploadStatus.uploading: null,
  UploadStatus.done: Get.theme.badgeTheme.backgroundColor,
  UploadStatus.error: Get.theme.colorScheme.error,
};

extension UploadStatusEx on UploadStatus {
  Color? get color => _colors[this];
}

enum MediaTypeEnum {
  none,

  banner,

  video,
}

extension MediaTypeEnumEx on MediaTypeEnum {
  bool get isVideo => MediaTypeEnum.video == this;
}

class MediaUploaderController extends GetxController {

  final MediaTypeEnum mediaType;
  final String fileName;
  final ImageInfoRule rule;

  MediaUploaderController(this.fileName, this.mediaType, this.rule);


  // final Rx<String> _fileName = Rx<String>("");
  // String get fileName => _fileName.value;
  // set fileName(String value) {
  //   _fileName.value = value;
  //   progress = 0;
  //   error = null;
  // }
  // bool get hasFile => fileName.isNotEmpty;

  final Rx<double> _progress = Rx<double>(0.0);
  double get progress => _progress.value;
  set progress(double value) {
    double normalizedProgress = math.min(1, math.max(0, value));

    if(normalizedProgress >= 1.0) {
      _checkErrors();
    }

    _progress.value = normalizedProgress;
  }

  String get percent => "${(100 * progress).round()}%";

  UploadStatus get status {
    if(errors.isNotEmpty) return UploadStatus.error;
    return progress < 1 ? UploadStatus.uploading : UploadStatus.done;
  }

  final RxList<String> _errors = RxList<String>();
  List<String> get errors => _errors;
  set errors(List<String> value) {
    _errors.value = value;
  }

  Iterable<String> get errorsText => errors.length <= 1
      ? errors
      : errors.asMap().entries.map((e) => "#${e.key+1}. ${e.value}");

  bool get hasError => status == UploadStatus.error;

  void _checkErrors() async {
    var info = await ImageMetaInfo.fromFile(File(fileName));
    errors = rule.getErrors(info);
  }


}
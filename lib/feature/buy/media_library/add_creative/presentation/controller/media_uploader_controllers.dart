import 'dart:async';

import 'package:advedro/core/utils/utils.dart';
import 'package:get/get.dart';

import '../../../medialibrary/data/model/ad_types_enum.dart';
import '../view/media_uploader/media_uploader.dart';

class MediaUploaderControllers {
  final Rx<AdTypesEnum> _stage = AdTypesEnum.all.obs;
  AdTypesEnum get stage => _stage.value;
  set stage(AdTypesEnum value) => _stage.value = value;


  final RxList<MediaUploaderController> _mediaControllers = RxList<MediaUploaderController>();

  final Rx<bool> _hasInteractedByUser = Rx<bool>(false);
  bool get hasInteractedByUser => _hasInteractedByUser.value;
  set hasInteractedByUser(bool value) => _hasInteractedByUser.value = value;

  bool get stageHasVideo => {AdTypesEnum.video, AdTypesEnum.push}.contains(stage);

  String? getErrorText(MediaTypeEnum mediaType) {
    if(!hasInteractedByUser) return null;


    if(mediaType.isVideo && !stageHasVideo) return null;

    final controllers = getMediaControllers(mediaType);
    if (controllers.isNotEmpty) {
      var err = controllers.where((c) => c.hasError);
      return err.isEmpty ? null : "Uploaded media has error(s)";
    } else {
      return "${mediaType.name.camelToSentence()} should not be empty";
    }
  }

  Iterable<MediaUploaderController> getMediaControllers(MediaTypeEnum mediaType) {
    return _mediaControllers.where((c) => c.mediaType == mediaType);
  }

  ImageInfoRule getImageRule(MediaTypeEnum mediaType) {
    switch(stage) {

      case AdTypesEnum.all:
        return ImageInfoRule();
      case AdTypesEnum.banner:
        return ImageInfoRule();
      case AdTypesEnum.native:
        return ImageInfoRule();
      case AdTypesEnum.push:
        return ImageInfoRule(
            validRatios: [
              mediaType == MediaTypeEnum.banner ? ImageSize(1, 1) : ImageSize(2, 1),
            ]
        );
      case AdTypesEnum.video:
        return ImageInfoRule();
    }
  }

  void addMedia(String path, MediaTypeEnum mediaType) {
    final rule = getImageRule(mediaType);
    final controller = MediaUploaderController(path, mediaType, rule);
    _mediaControllers.add(controller);

    Timer.periodic(50.milliseconds, (timer) {
      controller.progress += 0.01;
      if( controller.progress >= 1.0) timer.cancel();
    });


  }

  void removeMedia(MediaUploaderController controller) {
    controller.dispose();
    _mediaControllers.remove(controller);
  }

  void clearMediaUploaderControllers() {
    hasInteractedByUser = false;
    _mediaControllers.clear();
  }

  bool validateMediaUploaderControllers() {
    hasInteractedByUser = true;
    int errCount = 0;

    if(getErrorText(MediaTypeEnum.video) != null) {
      errCount++;
    }

    if(getErrorText(MediaTypeEnum.banner) != null) {
      errCount++;
    }
    return errCount == 0;
  }


  void disposeMediaUploaderControllers() {
    for(var c in _mediaControllers) {
      c.dispose();
    }
  }


}
import 'dart:io';
import 'dart:math' as math;

import 'package:advedro/core/data/enums/select_photo.dart';
import 'package:advedro/core/data/enums/smart_compress_image_type.dart';
import 'package:advedro/core/utils/permission_utils/permission_utils.dart';
import 'package:advedro/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';

/// A utility class used for manipulation of images captured or read from users device
class ImageUtils {
  ImageUtils._();

  /// Compress image in [file] using smart [type] provided
  ///
  /// Example:
  /// ```dart
  /// //Pick image
  /// final picker = ImagePicker();
  /// final picked = await picker.pickImage(source: imageSource, preferredCameraDevice: CameraDevice.rear);
  /// if (picked == null) return null;
  ///
  /// //Compress the file
  /// final compressed = await ImageUtils.compressImageSmart(File(picked.path), smartCompressType);
  /// ```
  static Future<XFile?> compressImageSmart(File file, SmartCompressImageTypeEnum type) async {
    int width;
    int height;
    final fileSize = file.readAsBytesSync().lengthInBytes ~/ 1024;
    int benchmark;
    int quality;
    if (type == SmartCompressImageTypeEnum.avatar) {
      width = 512;
      height = 512;
      benchmark = 50;
      quality = 69;
    } else if (type == SmartCompressImageTypeEnum.post) {
      width = 1280;
      height = 1280;
      benchmark = 120;
      quality = 69;
    } else if (type == SmartCompressImageTypeEnum.preview) {
      width = 96;
      height = 96;
      benchmark = 1;
      quality = 1;
    } else {
      throw Exception("invalid type");
    }
    if (fileSize < benchmark) return XFile(file.path);
    return await compressImage(file, quality: quality, maxHeight: height, maxWidth: width);
  }

  /// Compress an image in [file] with specified [quality]. [maxHeight] and [maxWidth] also can be specified
  ///
  /// [quality] is a number between 1 and 100
  ///
  /// Example:
  /// ```dart
  /// //Pick image
  /// final picker = ImagePicker();
  /// final picked = await picker.pickImage(source: imageSource, preferredCameraDevice: CameraDevice.rear);
  /// if (picked == null) return null;
  ///
  /// //Compress the file
  /// final compressed = await ImageUtils.compressImage(File(picked.path), quality: 70, maxWidth: 512);
  /// ```
  static Future<XFile?> compressImage(File file, {required int quality, int? maxHeight, int? maxWidth}) async {
    final dir = await path_provider.getTemporaryDirectory();
    final rnd = math.Random().nextInt(1000000);
    final targetPath = "${dir.absolute.path}/comp_$rnd.jpg";
    final decodedImage = await decodeImageFromList(file.readAsBytesSync());
    final scaleX = maxWidth! / decodedImage.width;
    final scaleY = maxHeight! / decodedImage.height;
    final scale = math.min(scaleX, scaleY);

    final comp = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      minWidth: (decodedImage.width * scale).toInt(),
      minHeight: (decodedImage.height * scale).toInt(),
      quality: quality,
    );
    return comp == null ? null : XFile(comp.path);
  }

  /// Rise a dialog and ask for [ImageSource], that can be either [ImageSource.camera] or [ImageSource.gallery]
  static Future<ImageSource?> selectImageType() async {
    Color accent = Get.theme.colorScheme.secondary;
    ImageSource? source = await showCupertinoModalPopup<ImageSource>(
      context: Get.context!,
      builder: (context) =>
          CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () => Get.back<ImageSource>(result: ImageSource.gallery),
                child: Row3(
                  child1: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.photo_outlined,
                      color: accent,
                      size: 32,
                    ),
                  ),
                  child2: const Text("Gallery"),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () => Get.back<ImageSource>(result: ImageSource.camera),
                child: Row3(
                  child1: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.photo_camera_outlined,
                      color: accent,
                      size: 32,
                    ),
                  ),
                  child2: const Text("Camera"),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () => Get.back<int>(result: null),
              child: Text(
                "Cancel",
                style: TextStyle(color: accent, fontWeight: FontWeight.bold),
              ),
            ),
          ),
    );

    if (Platform.isAndroid) {
      return source;
    } else if (source == ImageSource.gallery) { // Platform is iOS
      PermissionStatus status = await Permission.photos.request();
      if (status == PermissionStatus.granted) {
        return source;
      } else {
        await PermissionUtils.openPermissionSettings(SelectPhotoEnum.gallery);
        return null;
      }
    } else if (source == ImageSource.camera) {
      PermissionStatus status = await Permission.camera.request();
      if (status == PermissionStatus.granted) {
        return source;
      } else {
        await PermissionUtils.openPermissionSettings(SelectPhotoEnum.camera);
        return null;
      }
    }

    return source;
  }

  static Future<XFile?> pickImage({
    SmartCompressImageTypeEnum? smartCompressType,
  }) async {
    //Select Image Source
    ImageSource? imageSource = await selectImageType();
    if (imageSource == null) return null;

    //Pick image
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: imageSource, preferredCameraDevice: CameraDevice.rear);
    if (picked == null) {
      return null;
    }

    if (smartCompressType == null) return picked;

    //Compress if specified
    final compressed = await ImageUtils.compressImageSmart(File(picked.path), smartCompressType);

    return compressed ?? picked;
  }

  /// A wrapper for [ImageCropper]
  ///
  /// Rise a dialog and crops image in [file]
  static Future<CroppedFile?> crop(XFile? file) async {
    ImageCropper cropper = ImageCropper();
    return file == null ? null : cropper.cropImage(sourcePath: file.path);
  }

  /// Pick an image and then crop it
  static Future<CroppedFile?> pickImageAndCrop() async {
    var picked = await ImageUtils.pickImage();
    if (picked == null) return null;
    return ImageUtils.crop(picked);
  }
}

import 'dart:io';

import 'package:advedro/core/data/models/device_info/device_info_model.dart';
import 'package:advedro/core/data/types/json.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

/// Helper class used for read Hardware information from device
class DeviceInfoUtils {
  DeviceInfoUtils._();

  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  /// Gets [DeviceInfoModel] A data model for device Information
  ///
  /// Example
  /// ```dart
  /// var deviceInfo = await DeviceInfoUtils.getDeviceInfo();
  /// if(deviceInfo.hasError) {
  ///   print("Oops!: ${deviceInfo.error}");
  /// } else {
  ///   print("Model=${deviceInfo.model ?? ""}");
  ///   print("SN=${deviceInfo.serialNumber ?? ""}");
  /// }
  /// ```
  static Future<DeviceInfoModel> getDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        return DeviceInfoModel(data: _readAndroidBuildData(await _deviceInfoPlugin.androidInfo));
      } else if (Platform.isIOS) {
        return DeviceInfoModel(data: _readIosDeviceInfo(await _deviceInfoPlugin.iosInfo));
      } else {
        return DeviceInfoModel.error("Platform not supported");
      }
    } on PlatformException {
      return DeviceInfoModel.error("Failed to get platform version.");
    }
  }

  static Json _readAndroidBuildData(AndroidDeviceInfo build) {
    return {
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches': ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
  }

  static Json _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}

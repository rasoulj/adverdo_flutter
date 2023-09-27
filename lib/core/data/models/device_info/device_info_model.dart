import 'dart:io';
import 'package:advedro/core/data/types/json.dart';

class _K {
  static const String model = "model";
  static const String serialNumber = "serialNumber";
  static const String identifierForVendor = "identifierForVendor";
}

/// Data model for Device Hardware Information
class DeviceInfoModel {
  /// Raw data read from device
  final Json data;

  /// Potential errors may occurred during reading device information
  final String? error;

  /// Creates an instance of this data model
  DeviceInfoModel({required this.data, this.error});

  /// Creates an error instance
  factory DeviceInfoModel.error(String message) {
    return DeviceInfoModel(data: {}, error: message);
  }

  /// Name of Device model
  String? get model => data.getString(_K.model);

  /// Serial number Device
  String? get serialNumber => data.getString(Platform.isAndroid ? _K.serialNumber : _K.identifierForVendor);

  /// Whether an error exist in reading HW information
  bool get hasError => error != null;

  /// Return a Json model to be used in API calls
  Json toJson() => {
        _K.model: model,
        _K.serialNumber: serialNumber,
      };

  @override
  String toString() {
    return "DeviceInfo{model=$model, SN=$serialNumber}";
  }
}

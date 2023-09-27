import 'dart:convert';

import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';

ChangePasswordModel changePasswordModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

class ChangePasswordModel extends ResponseBase {
  ChangePasswordModel({
    this.apiKeys,
  });

  final String? apiKeys;

  factory ChangePasswordModel.fromJson(Json json) => ChangePasswordModel(
        apiKeys: json["apiKeys"],
      );

  factory ChangePasswordModel.fromRawJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

  @override
  Json toJson() => {
        "apiKeys": apiKeys,
      };
}

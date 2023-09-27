import 'dart:convert';

import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel extends ResponseBase {
  LoginModel({
    this.apiKeys,
  });

  final String? apiKeys;

  @override
  factory LoginModel.fromJson(Json json) => LoginModel(
        apiKeys: json["apiKeys"],
      );

  @override
  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  @override
  Map<String, dynamic> toJson() => {
        "apiKeys": apiKeys,
      };
}

import 'dart:convert';

import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';

AccountDetailModel accountDetailModelFromJson(String str) => AccountDetailModel.fromJson(json.decode(str));

String accountDetailModelToJson(AccountDetailModel data) => json.encode(data.toJson());

class AccountDetailModel extends ResponseBase {
  AccountDetailModel({
    this.apiKeys,
  });

  final String? apiKeys;

  factory AccountDetailModel.fromJson(Json json) => AccountDetailModel(
        apiKeys: json["apiKeys"],
      );

  factory AccountDetailModel.fromRawJson(String str) => AccountDetailModel.fromJson(json.decode(str));

  @override
  Json toJson() => {
        "apiKeys": apiKeys,
      };
}

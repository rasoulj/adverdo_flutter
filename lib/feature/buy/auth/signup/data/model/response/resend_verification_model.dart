import 'dart:convert';

ResendVerificationModel resendVerificationModelFromJson(String str) => ResendVerificationModel.fromJson(json.decode(str));

String resendVerificationModelToJson(ResendVerificationModel data) => json.encode(data.toJson());

class ResendVerificationModel {
  final String? result;

  ResendVerificationModel({
    this.result,
  });

  factory ResendVerificationModel.fromJson(Map<String, dynamic> json) => ResendVerificationModel(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };
}

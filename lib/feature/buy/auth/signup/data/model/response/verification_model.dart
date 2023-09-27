import 'dart:convert';

VerificationModel verificationModelFromJson(String str) => VerificationModel.fromJson(json.decode(str));

String verificationModelToJson(VerificationModel data) => json.encode(data.toJson());

class VerificationModel {
  final String? result;

  VerificationModel({
    this.result,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) => VerificationModel(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };
}

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  final String? result;

  SignUpModel({
    this.result,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };
}

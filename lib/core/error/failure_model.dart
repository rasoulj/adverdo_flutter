import 'dart:convert';

FailureModel failureModelFromJson(String str) => FailureModel.fromJson(json.decode(str));

String failureModelToJson(FailureModel data) => json.encode(data.toJson());

class FailureModel {
  FailureModel({
    required this.message,
    this.errors,
  });

  final String message;
  final Errors? errors;

  factory FailureModel.fromJson(Map<String, dynamic> json) => FailureModel(
        message: json["message"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors?.toJson(),
      };
}

class Errors {
  Errors({
    this.email,
  });

  final List<String>? email;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json["email"] == null ? [] : List<String>.from(json["email"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
      };
}

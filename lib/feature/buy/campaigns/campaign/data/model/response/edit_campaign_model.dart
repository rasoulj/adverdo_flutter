import 'dart:convert';

EditCampaignModel editCampaignModelFromJson(String str) => EditCampaignModel.fromJson(json.decode(str));

String editCampaignModelToJson(EditCampaignModel data) => json.encode(data.toJson());

class EditCampaignModel {
  final String? result;

  EditCampaignModel({
    this.result,
  });

  factory EditCampaignModel.fromJson(Map<String, dynamic> json) => EditCampaignModel(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };
}

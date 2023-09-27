import 'dart:convert';

DeleteCampaignModel deleteCampaignModelFromJson(String str) => DeleteCampaignModel.fromJson(json.decode(str));

String deleteCampaignModelToJson(DeleteCampaignModel data) => json.encode(data.toJson());

class DeleteCampaignModel {
  final String? result;

  DeleteCampaignModel({
    this.result,
  });

  factory DeleteCampaignModel.fromJson(Map<String, dynamic> json) => DeleteCampaignModel(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };
}

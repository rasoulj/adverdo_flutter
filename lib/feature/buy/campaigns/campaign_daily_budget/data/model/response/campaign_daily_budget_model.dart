import 'dart:convert';

DailyBudgetCampaignModel dailyBudgetCampaignModelFromJson(String str) => DailyBudgetCampaignModel.fromJson(json.decode(str));

String dailyBudgetCampaignModelToJson(DailyBudgetCampaignModel data) => json.encode(data.toJson());

class DailyBudgetCampaignModel {
  final String? result;

  DailyBudgetCampaignModel({
    this.result,
  });

  factory DailyBudgetCampaignModel.fromJson(Map<String, dynamic> json) => DailyBudgetCampaignModel(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };
}

import '../model/request/target_campaign_request.dart';
import '../model/response/target_campaign_model.dart';

abstract class TargetCampaignDataSource {
  Future<TargetCampaignModel> getTarget({required TargetCampaignRequest request});
}

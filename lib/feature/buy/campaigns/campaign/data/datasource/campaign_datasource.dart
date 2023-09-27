import 'package:advedro/feature/buy/campaigns/campaign/data/model/response/edit_campaign_model.dart';

import '../model/request/create_campaign_request.dart';
import '../model/request/delete_campaign_request.dart';
import '../model/request/edit_campaign_request.dart';
import '../model/response/campaign_model.dart';
import '../model/request/campaign_request.dart';
import '../model/response/create_campaign_model.dart';
import '../model/response/delet_campaign_model.dart';

abstract class CampaignDataSource {
  Future<CampaignModel> getCampaign({required CampaignRequest request});
  Future<CreateCampaignModel> createCampaign({required CreateCampaignRequest request});
  Future<EditCampaignModel> editCampaign({required EditCampaignRequest request});
  Future<DeleteCampaignModel> deleteCampaign({required DeleteCampaignRequest request});
}

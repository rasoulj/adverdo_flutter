import 'package:advedro/feature/buy/campaigns/campaign_bid/data/model/request/campaign_bid_request.dart';
import 'package:advedro/feature/buy/campaigns/campaign_bid/data/model/response/campaign_bid_model.dart';

abstract class CampaignBidDataSource {
  Future<CampaignBidModel> updateBide({required CampaignBidRequest request});
}

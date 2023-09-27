import 'package:advedro/core/error/failures.dart';
import 'package:advedro/feature/buy/campaigns/campaign_bid/data/model/request/campaign_bid_request.dart';
import 'package:advedro/feature/buy/campaigns/campaign_bid/data/model/response/campaign_bid_model.dart';
import 'package:dartz/dartz.dart';

abstract class CampaignBidRepository {
  Future<Either<Failure, CampaignBidModel>> updateBide({required CampaignBidRequest request});
}

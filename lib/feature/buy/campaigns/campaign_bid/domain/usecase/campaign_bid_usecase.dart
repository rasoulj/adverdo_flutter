import 'package:advedro/core/error/failures.dart';
import 'package:advedro/feature/buy/campaigns/campaign_bid/data/model/request/campaign_bid_request.dart';
import 'package:advedro/feature/buy/campaigns/campaign_bid/data/model/response/campaign_bid_model.dart';
import 'package:dartz/dartz.dart';

import '../repository/campaign_bid_repository.dart';

class CampaignBidUseCase {
  const CampaignBidUseCase({required this.repository});
  final CampaignBidRepository repository;

  Future<Either<Failure, CampaignBidModel>> call({required CampaignBidRequest request}) async {
    var result = await repository.updateBide(request: request);
    return result;
  }
}

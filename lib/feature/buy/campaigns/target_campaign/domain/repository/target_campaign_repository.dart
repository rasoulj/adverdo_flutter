import '../../../../../../core/error/failures.dart';
import '../../data/model/request/target_campaign_request.dart';
import '../../data/model/response/target_campaign_model.dart';
import 'package:dartz/dartz.dart';

abstract class TargetCampaignRepository {
  Future<Either<Failure, TargetCampaignModel>> getTarget({required TargetCampaignRequest request});
}

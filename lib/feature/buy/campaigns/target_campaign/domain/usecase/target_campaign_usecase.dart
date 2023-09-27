import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failures.dart';
import '../../data/model/request/target_campaign_request.dart';
import '../../data/model/response/target_campaign_model.dart';
import '../repository/target_campaign_repository.dart';

class TargetCampaignUseCase {
  const TargetCampaignUseCase({required this.repository});
  final TargetCampaignRepository repository;

  Future<Either<Failure, TargetCampaignModel>> call({required TargetCampaignRequest request}) async {
    var result = await repository.getTarget(request: request);
    return result;
  }
}

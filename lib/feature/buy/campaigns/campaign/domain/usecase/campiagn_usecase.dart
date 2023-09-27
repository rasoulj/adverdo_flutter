import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failures.dart';
import '../../data/model/request/campaign_request.dart';
import '../../data/model/response/campaign_model.dart';
import '../repository/campaign_repository.dart';

class CampaignUseCase {
  const CampaignUseCase({required this.repository});
  final CampaignRepository repository;

  Future<Either<Failure, CampaignModel>> call({required CampaignRequest request}) async {
    var result = await repository.getCampaign(request: request);
    return result;
  }
}

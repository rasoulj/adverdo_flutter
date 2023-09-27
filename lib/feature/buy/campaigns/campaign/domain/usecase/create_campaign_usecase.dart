import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failures.dart';
import '../../data/model/request/create_campaign_request.dart';
import '../../data/model/response/create_campaign_model.dart';
import '../repository/campaign_repository.dart';

class CreateCampaignUseCase {
  const CreateCampaignUseCase({required this.repository});
  final CampaignRepository repository;

  Future<Either<Failure, CreateCampaignModel>> call({required CreateCampaignRequest request}) async {
    var result = await repository.createCampaign(request: request);
    return result;
  }
}

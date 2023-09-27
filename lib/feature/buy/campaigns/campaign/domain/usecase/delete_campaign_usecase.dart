import 'package:advedro/core/error/failures.dart';
import 'package:advedro/feature/buy/campaigns/campaign/data/model/request/delete_campaign_request.dart';
import 'package:advedro/feature/buy/campaigns/campaign/data/model/response/delet_campaign_model.dart';
import 'package:dartz/dartz.dart';

import '../repository/campaign_repository.dart';

class DeleteCampaignUseCase {
  const DeleteCampaignUseCase({required this.repository});
  final CampaignRepository repository;

  Future<Either<Failure, DeleteCampaignModel>> call({required DeleteCampaignRequest request}) async {
    var result = await repository.deleteCampaign(request: request);
    return result;
  }
}

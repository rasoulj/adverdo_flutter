import 'package:advedro/core/error/failures.dart';
import 'package:advedro/feature/buy/campaigns/campaign/data/model/response/edit_campaign_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/edit_campaign_request.dart';
import '../repository/campaign_repository.dart';

class EditCampaignUseCase {
  const EditCampaignUseCase({required this.repository});
  final CampaignRepository repository;

  Future<Either<Failure, EditCampaignModel>> call({required EditCampaignRequest request}) async {
    var result = await repository.editCampaign(request: request);
    return result;
  }
}

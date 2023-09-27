import 'package:advedro/core/error/failures.dart';
import 'package:advedro/feature/buy/campaigns/campaign/data/model/request/campaign_request.dart';
import 'package:advedro/feature/buy/campaigns/campaign/data/model/response/campaign_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/create_campaign_request.dart';
import '../../data/model/request/delete_campaign_request.dart';
import '../../data/model/request/edit_campaign_request.dart';
import '../../data/model/response/create_campaign_model.dart';
import '../../data/model/response/delet_campaign_model.dart';
import '../../data/model/response/edit_campaign_model.dart';

abstract class CampaignRepository {
  Future<Either<Failure, CampaignModel>> getCampaign({required CampaignRequest request});
  Future<Either<Failure, CreateCampaignModel>> createCampaign({required CreateCampaignRequest request});
  Future<Either<Failure, EditCampaignModel>> editCampaign({required EditCampaignRequest request});
  Future<Either<Failure, DeleteCampaignModel>> deleteCampaign({required DeleteCampaignRequest request});
}

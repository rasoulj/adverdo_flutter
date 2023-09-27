import 'package:advedro/feature/buy/campaigns/campaign/data/model/request/delete_campaign_request.dart';
import 'package:advedro/feature/buy/campaigns/campaign/data/model/response/create_campaign_model.dart';
import 'package:advedro/feature/buy/campaigns/campaign/data/model/response/delet_campaign_model.dart';
import 'package:advedro/feature/buy/campaigns/campaign/data/model/response/edit_campaign_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../core/error/exceptions.dart';
import '../../../../../../core/error/failures.dart';
import '../../domain/repository/campaign_repository.dart';
import '../datasource/campaign_datasource.dart';
import '../model/request/campaign_request.dart';
import '../model/request/create_campaign_request.dart';
import '../model/request/edit_campaign_request.dart';
import '../model/response/campaign_model.dart';

class CampaignRepositoryImpl implements CampaignRepository {
  const CampaignRepositoryImpl({required this.dataSource});
  final CampaignDataSource dataSource;

  @override
  Future<Either<Failure, CampaignModel>> getCampaign({required CampaignRequest request}) async {
    try {
      var result = await dataSource.getCampaign(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }

  @override
  Future<Either<Failure, CreateCampaignModel>> createCampaign({required CreateCampaignRequest request}) async {
    try {
      var result = await dataSource.createCampaign(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }

  @override
  Future<Either<Failure, EditCampaignModel>> editCampaign({required EditCampaignRequest request}) async {
    try {
      var result = await dataSource.editCampaign(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }

  @override
  Future<Either<Failure, DeleteCampaignModel>> deleteCampaign({required DeleteCampaignRequest request}) async {
    try {
      var result = await dataSource.deleteCampaign(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

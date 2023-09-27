import 'package:dartz/dartz.dart';

import '../../../../../../core/error/exceptions.dart';
import '../../../../../../core/error/failures.dart';
import '../../domain/repository/target_campaign_repository.dart';
import '../datasource/target_campaign_datasource.dart';
import '../model/request/target_campaign_request.dart';
import '../model/response/target_campaign_model.dart';

class TargetCampaignRepositoryImpl implements TargetCampaignRepository {
  const TargetCampaignRepositoryImpl({required this.dataSource});
  final TargetCampaignDataSource dataSource;

  @override
  Future<Either<Failure, TargetCampaignModel>> getTarget({required TargetCampaignRequest request}) async {
    try {
      var result = await dataSource.getTarget(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

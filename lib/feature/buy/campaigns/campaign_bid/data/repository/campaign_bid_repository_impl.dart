import 'package:advedro/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../domain/repository/campaign_bid_repository.dart';
import '../datasource/campaign_bid_datasource.dart';
import '../model/request/campaign_bid_request.dart';
import '../model/response/campaign_bid_model.dart';

class CampaignBidRepositoryImpl implements CampaignBidRepository {
  const CampaignBidRepositoryImpl({required this.dataSource});
  final CampaignBidDataSource dataSource;

  @override
  Future<Either<Failure, CampaignBidModel>> updateBide({required CampaignBidRequest request}) async {
    try {
      var result = await dataSource.updateBide(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

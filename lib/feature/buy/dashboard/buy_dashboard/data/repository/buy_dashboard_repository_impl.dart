import 'package:advedro/core/error/exceptions.dart';
import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/buy_dashboard_repository.dart';
import '../datasource/buy_dashboard_datasource.dart';
import '../model/request/buy_dashboard_request.dart';
import '../model/response/buy_dashboard_model.dart';

class BuyDashboardRepositoryImpl implements BuyDashboardRepository {
  const BuyDashboardRepositoryImpl({required this.dataSource});
  final BuyDashboardDataSource dataSource;

  @override
  Future<Either<Failure, BuyDashboardModel>> fetch({required BuyDashboardRequest request}) async {
    try {
      var result = await dataSource.fetch(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

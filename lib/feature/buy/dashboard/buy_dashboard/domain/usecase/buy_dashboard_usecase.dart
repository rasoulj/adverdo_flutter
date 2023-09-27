import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/buy_dashboard_request.dart';
import '../../data/model/response/buy_dashboard_model.dart';
import '../repository/buy_dashboard_repository.dart';

class BuyDashboardUseCase {
  const BuyDashboardUseCase({required this.repository});
  final BuyDashboardRepository repository;

  Future<Either<Failure, BuyDashboardModel>> call({required BuyDashboardRequest request}) async {
    var result = await repository.fetch(request: request);
    return result;
  }
}

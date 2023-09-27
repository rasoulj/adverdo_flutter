
import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/buy_dashboard_request.dart';
import '../../data/model/response/buy_dashboard_model.dart';

abstract class BuyDashboardRepository {
  Future<Either<Failure, BuyDashboardModel>> fetch({required BuyDashboardRequest request});
}

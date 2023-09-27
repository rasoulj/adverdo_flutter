import '../../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../data/model/request/account_detail_request.dart';
import '../../data/model/response/account_detail_model.dart';

abstract class AccountDetailRepository {
  Future<Either<Failure, AccountDetailModel>> save({required AccountDetailRequest request});
}

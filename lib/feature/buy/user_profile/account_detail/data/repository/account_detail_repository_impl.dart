import 'package:advedro/core/error/exceptions.dart';
import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/account_detail_repository.dart';
import '../datasource/account_detail_datasource.dart';
import '../model/request/account_detail_request.dart';
import '../model/response/account_detail_model.dart';

class AccountDetailRepositoryImpl implements AccountDetailRepository {
  const AccountDetailRepositoryImpl({required this.dataSource});
  final AccountDetailDataSource dataSource;

  @override
  Future<Either<Failure, AccountDetailModel>> save({required AccountDetailRequest request}) async {
    try {
      var result = await dataSource.save(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

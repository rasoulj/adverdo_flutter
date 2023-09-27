import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/account_detail_request.dart';
import '../../data/model/response/account_detail_model.dart';
import '../repository/account_detail_repository.dart';

class AccountDetailUseCase {
  const AccountDetailUseCase({required this.repository});
  final AccountDetailRepository repository;

  Future<Either<Failure, AccountDetailModel>> call({required AccountDetailRequest request}) async {
    var result = await repository.save(request: request);
    return result;
  }
}

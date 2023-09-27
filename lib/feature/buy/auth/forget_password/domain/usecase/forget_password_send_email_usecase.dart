import 'package:advedro/core/error/failures.dart';
import 'package:advedro/feature/buy/auth/forget_password/data/model/request/forget_password_request.dart';
import 'package:advedro/feature/buy/auth/forget_password/data/model/response/forget_password_model.dart';
import 'package:dartz/dartz.dart';

import '../repository/forget_password_repository.dart';

class ForgetPasswordUseCase {
  const ForgetPasswordUseCase({required this.repository});
  final ForgetPasswordRepository repository;

  Future<Either<Failure, ForgetPasswordModel>> call({required ForgetPasswordRequest request}) async {
    var result = await repository.forgetPasswordSendEmail(request: request);
    return result;
  }
}

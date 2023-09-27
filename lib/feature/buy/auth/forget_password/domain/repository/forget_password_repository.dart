import 'package:advedro/core/error/failures.dart';
import 'package:advedro/feature/buy/auth/forget_password/data/model/request/forget_password_request.dart';
import 'package:advedro/feature/buy/auth/forget_password/data/model/response/forget_password_model.dart';
import 'package:dartz/dartz.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, ForgetPasswordModel>> forgetPasswordSendEmail({required ForgetPasswordRequest request});
}

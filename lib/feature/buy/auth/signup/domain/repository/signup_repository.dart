import 'package:advedro/feature/buy/auth/signup/data/model/request/verification_request.dart';
import 'package:advedro/feature/buy/auth/signup/data/model/response/verification_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../data/model/request/signup_request.dart';
import '../../data/model/response/resend_verification_model.dart';
import '../../data/model/response/signup_model.dart';

abstract class SignUpRepository {
  Future<Either<Failure, SignUpModel>> signUp({required SignUpRequest request});
  Future<Either<Failure, VerificationModel>> getCode({required VerificationRequest request});
  Future<Either<Failure, ResendVerificationModel>> resendCode({required VerificationRequest request});
}

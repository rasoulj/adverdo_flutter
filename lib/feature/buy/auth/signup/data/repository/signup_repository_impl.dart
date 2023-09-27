import 'package:advedro/core/error/exceptions.dart';
import 'package:advedro/feature/buy/auth/signup/data/model/response/resend_verification_model.dart';
import 'package:advedro/feature/buy/auth/signup/data/model/response/verification_model.dart';
import 'package:advedro/feature/buy/auth/signup/data/model/request/verification_request.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../domain/repository/signup_repository.dart';
import '../datasource/signup_datasource.dart';
import '../model/request/signup_request.dart';
import '../model/response/signup_model.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  const SignUpRepositoryImpl({required this.dataSource});
  final SignUpDataSource dataSource;

  @override
  Future<Either<Failure, SignUpModel>> signUp({required SignUpRequest request}) async {
    try {
      var result = await dataSource.signUp(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }

  @override
  Future<Either<Failure, VerificationModel>> getCode({required VerificationRequest request}) async {
    try {
      var result = await dataSource.getCode(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }

  @override
  Future<Either<Failure, ResendVerificationModel>> resendCode({required VerificationRequest request}) async {
    try {
      var result = await dataSource.resendCode(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

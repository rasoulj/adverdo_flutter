import 'package:dartz/dartz.dart';

import '../../../../../../core/error/exceptions.dart';
import '../../../../../../core/error/failures.dart';
import '../../domain/repository/forget_password_repository.dart';
import '../datasource/forget_password_datasource.dart';
import '../model/request/forget_password_request.dart';
import '../model/response/forget_password_model.dart';

class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  const ForgetPasswordRepositoryImpl({required this.dataSource});
  final ForgetPasswordDataSource dataSource;

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPasswordSendEmail({required ForgetPasswordRequest request}) async {
    try {
      var result = await dataSource.forgetPasswordSendEmail(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

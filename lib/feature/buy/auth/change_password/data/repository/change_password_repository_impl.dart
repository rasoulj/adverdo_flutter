import 'package:advedro/core/error/exceptions.dart';
import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/change_password_repository.dart';
import '../datasource/change_password_datasource.dart';
import '../model/request/change_password_request.dart';
import '../model/response/change_password_model.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  const ChangePasswordRepositoryImpl({required this.dataSource});
  final ChangePasswordDataSource dataSource;

  @override
  Future<Either<Failure, ChangePasswordModel>> changePassword({required ChangePasswordRequest request}) async {
    try {
      var result = await dataSource.changePassword(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

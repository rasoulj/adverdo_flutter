import 'package:advedro/core/error/exceptions.dart';
import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/login_repository.dart';
import '../datasource/login_datasource.dart';
import '../model/request/login_request.dart';
import '../model/response/login_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({required this.dataSource});
  final LoginDataSource dataSource;

  @override
  Future<Either<Failure, LoginModel>> login({required LoginRequest request}) async {
    try {
      var result = await dataSource.login(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

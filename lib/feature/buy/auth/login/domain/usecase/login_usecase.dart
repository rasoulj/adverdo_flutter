import '../../../../../../core/error/failures.dart';
import '../../data/model/request/login_request.dart';
import '../../data/model/response/login_model.dart';
import '../repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  const LoginUseCase({required this.repository});
  final LoginRepository repository;

  Future<Either<Failure, LoginModel>> call({required LoginRequest request}) async {
    var result = await repository.login(request: request);
    return result;
  }
}

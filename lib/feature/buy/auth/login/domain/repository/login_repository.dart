import '../../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../data/model/request/login_request.dart';
import '../../data/model/response/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> login({required LoginRequest request});
}

import '../../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../data/model/request/change_password_request.dart';
import '../../data/model/response/change_password_model.dart';

abstract class ChangePasswordRepository {
  Future<Either<Failure, ChangePasswordModel>> changePassword({required ChangePasswordRequest request});
}

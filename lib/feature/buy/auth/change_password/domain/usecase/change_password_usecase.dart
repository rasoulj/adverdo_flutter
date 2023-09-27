import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/change_password_request.dart';
import '../../data/model/response/change_password_model.dart';
import '../repository/change_password_repository.dart';

class ChangePasswordUseCase {
  const ChangePasswordUseCase({required this.repository});
  final ChangePasswordRepository repository;

  Future<Either<Failure, ChangePasswordModel>> call({required ChangePasswordRequest request}) async {
    var result = await repository.changePassword(request: request);
    return result;
  }
}

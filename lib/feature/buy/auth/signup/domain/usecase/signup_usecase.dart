import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../data/model/request/signup_request.dart';
import '../../data/model/response/signup_model.dart';
import '../repository/signup_repository.dart';

class SignUpUseCase {
  const SignUpUseCase({required this.repository});
  final SignUpRepository repository;

  Future<Either<Failure, SignUpModel>> call({required SignUpRequest request}) async {
    var result = await repository.signUp(request: request);
    return result;
  }
}

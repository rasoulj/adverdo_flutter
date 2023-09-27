import '../../../../../../core/error/failures.dart';
import '../../data/model/request/verification_request.dart';
import '../../data/model/response/verification_model.dart';
import '../repository/signup_repository.dart';
import 'package:dartz/dartz.dart';

class GetVerificationCodeUseCase {
  const GetVerificationCodeUseCase({required this.repository});
  final SignUpRepository repository;

  Future<Either<Failure, VerificationModel>> call({required VerificationRequest request}) async {
    var result = await repository.getCode(request: request);
    return result;
  }
}

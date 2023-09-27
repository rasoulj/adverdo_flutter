import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failures.dart';
import '../../data/model/request/verification_request.dart';
import '../../data/model/response/resend_verification_model.dart';
import '../repository/signup_repository.dart';

class ResendVerificationCodeUseCase {
  const ResendVerificationCodeUseCase({required this.repository});
  final SignUpRepository repository;

  Future<Either<Failure, ResendVerificationModel>> call({required VerificationRequest request}) async {
    var result = await repository.resendCode(request: request);
    return result;
  }
}

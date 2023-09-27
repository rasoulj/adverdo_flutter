import 'package:advedro/feature/buy/auth/signup/data/model/request/signup_request.dart';
import 'package:advedro/feature/buy/auth/signup/data/model/request/verification_request.dart';
import 'package:advedro/feature/buy/auth/signup/data/model/response/signup_model.dart';
import 'package:advedro/feature/buy/auth/signup/data/model/response/verification_model.dart';

import '../model/response/resend_verification_model.dart';

abstract class SignUpDataSource {
  Future<SignUpModel> signUp({required SignUpRequest request});
  Future<VerificationModel> getCode({required VerificationRequest request});
  Future<ResendVerificationModel> resendCode({required VerificationRequest request});
}

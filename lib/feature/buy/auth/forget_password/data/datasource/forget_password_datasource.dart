import '../model/request/forget_password_request.dart';
import '../model/response/forget_password_model.dart';

abstract class ForgetPasswordDataSource {
  Future<ForgetPasswordModel> forgetPasswordSendEmail({required ForgetPasswordRequest request});
}

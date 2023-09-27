
import '../model/request/change_password_request.dart';
import '../model/response/change_password_model.dart';

abstract class ChangePasswordDataSource {
  Future<ChangePasswordModel> changePassword({required ChangePasswordRequest request});
}

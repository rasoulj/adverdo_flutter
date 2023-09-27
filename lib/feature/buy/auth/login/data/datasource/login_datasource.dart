import '../model/request/login_request.dart';
import '../model/response/login_model.dart';

abstract class LoginDataSource {
  Future<LoginModel> login({required LoginRequest request});
}

import 'package:dio/dio.dart';

import '../../../../../../config/urls/urls.dart';
import '../../../../../../core/error/http_error_actions.dart';
import '../../../../../../core/network_info/dio_client_service/dio_client_service.dart';
import '../model/request/login_request.dart';
import '../model/response/login_model.dart';
import 'login_datasource.dart';

class LoginDataSourceImpl implements LoginDataSource {
  const LoginDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<LoginModel> login({required LoginRequest request}) async {
    Map data = {
      "email": request.email,
      "password": request.password,
      "twofa_code": 326598,
      "device_info": {"key1": "value1", "key2": 2}
    };
    try {
      Response response = await dio().post(Urls.loginUrl, data: data);
      if (response.statusCode == 200 && response.data != null) {
        return LoginModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }
}

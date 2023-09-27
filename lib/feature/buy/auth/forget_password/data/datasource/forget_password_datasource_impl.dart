import 'package:advedro/config/urls/urls.dart';
import 'package:advedro/core/error/http_error_actions.dart';
import 'package:advedro/feature/buy/auth/forget_password/data/model/response/forget_password_model.dart';

import 'package:advedro/feature/buy/auth/forget_password/data/model/request/forget_password_request.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/network_info/dio_client_service/dio_client_service.dart';
import 'forget_password_datasource.dart';

class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  const ForgetPasswordDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<ForgetPasswordModel> forgetPasswordSendEmail({required ForgetPasswordRequest request}) async {
    try {
      Map data = {"email": request.email};
      Response response = await dio().post(Urls.forgetPasswordUrl, data: data);
      if (response.statusCode == 200 && response.data != null) {
        return ForgetPasswordModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }
}

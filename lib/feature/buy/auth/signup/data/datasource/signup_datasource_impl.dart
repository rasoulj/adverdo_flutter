import 'package:advedro/config/urls/urls.dart';
import 'package:advedro/core/error/http_error_actions.dart';
import 'package:advedro/feature/buy/auth/signup/data/model/response/resend_verification_model.dart';
import 'package:advedro/feature/buy/auth/signup/data/model/response/verification_model.dart';
import 'package:advedro/feature/buy/auth/signup/data/model/request/verification_request.dart';
import 'package:dio/dio.dart';

import 'signup_datasource.dart';
import '../model/response/signup_model.dart';
import '../model/request/signup_request.dart';
import '../../../../../../core/network_info/dio_client_service/dio_client_service.dart';

class SignUpDataSourceImpl implements SignUpDataSource {
  const SignUpDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<SignUpModel> signUp({required SignUpRequest request}) async {
    Map data = {
      "first_name": "the first name",
      "last_name": "the last name",
      "username": "the username",
      "email": "mail@domain.com",
      "password": 123456,
      "phone": 123456789,
      "skype_account": "@skype_account",
      "timezone": 2535,
      "company": {"name": "the company name", "vat": 21},
      "device_info": {"ref": "#/components/examples/device_info"}
    };
    try {
      Response response = await dio().post(Urls.signUpUrl, data: data);
      if (response.statusCode == 200 && response.data != null) {
        return SignUpModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }

  @override
  Future<VerificationModel> getCode({required VerificationRequest request}) async {
    try {
      Map data = {};
      Response response = await dio().post(Urls.verificationGetCodeUrl, data: data);
      if (response.statusCode == 200 && response.data != null) {
        return VerificationModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }

  @override
  Future<ResendVerificationModel> resendCode({required VerificationRequest request}) async {
    try {
      Map data = {};
      Response response = await dio().post(Urls.resendVerificationGetCodeUrl, data: data);
      if (response.statusCode == 200 && response.data != null) {
        return ResendVerificationModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }
}

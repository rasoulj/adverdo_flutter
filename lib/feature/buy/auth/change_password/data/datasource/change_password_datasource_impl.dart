import 'package:advedro/core/api_method/api_method.dart';
import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';

import '../model/request/change_password_request.dart';
import '../model/response/change_password_model.dart';
import 'change_password_datasource.dart';

class ChangePasswordDataSourceImpl implements ChangePasswordDataSource {
  const ChangePasswordDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<ChangePasswordModel> changePassword({required ChangePasswordRequest request}) async {
    return ApiMethod<ChangePasswordRequest, ChangePasswordModel>(
      dio,
      parser: ChangePasswordModel.fromRawJson,
      request: request,
    ).call();
  }
}

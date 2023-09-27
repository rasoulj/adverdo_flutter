import 'package:advedro/core/api_method/api_method.dart';
import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';

import '../model/request/account_detail_request.dart';
import '../model/response/account_detail_model.dart';
import 'account_detail_datasource.dart';

class AccountDetailDataSourceImpl implements AccountDetailDataSource {
  const AccountDetailDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<AccountDetailModel> save({required AccountDetailRequest request}) async {
    return ApiMethod<AccountDetailRequest, AccountDetailModel>(
      dio,
      parser: AccountDetailModel.fromRawJson,
      request: request,
    ).call();
  }
}

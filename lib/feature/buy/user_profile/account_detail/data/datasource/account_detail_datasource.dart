import '../model/request/account_detail_request.dart';
import '../model/response/account_detail_model.dart';

abstract class AccountDetailDataSource {
  Future<AccountDetailModel> save({required AccountDetailRequest request});
}

import '../../../../../../config/urls/urls.dart';
import '../../../../../../core/error/http_error_actions.dart';
import 'target_campaign_datasource.dart';
import '../model/response/target_campaign_model.dart';
import '../model/request/target_campaign_request.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/network_info/dio_client_service/dio_client_service.dart';

class TargetCampaignDataSourceImpl implements TargetCampaignDataSource {
  const TargetCampaignDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<TargetCampaignModel> getTarget({required TargetCampaignRequest request}) async {
    try {
      Response response = await dio().get(Urls.targetCampaignUrl);
      if (response.statusCode == 200 && response.data != null) {
        return TargetCampaignModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }
}

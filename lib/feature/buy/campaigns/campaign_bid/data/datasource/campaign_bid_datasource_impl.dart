import '../../../../../../config/urls/urls.dart';
import '../../../../../../core/error/http_error_actions.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/network_info/dio_client_service/dio_client_service.dart';
import '../model/request/campaign_bid_request.dart';
import '../model/response/campaign_bid_model.dart';
import 'campaign_bid_datasource.dart';

class CampaignBidDataSourceImpl implements CampaignBidDataSource {
  const CampaignBidDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<CampaignBidModel> updateBide({required CampaignBidRequest request}) async {
    try {
      Response response = await dio().put(Urls.campaignBidUrl(id: request.id));
      if (response.statusCode == 200 && response.data != null) {
        return CampaignBidModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }
}

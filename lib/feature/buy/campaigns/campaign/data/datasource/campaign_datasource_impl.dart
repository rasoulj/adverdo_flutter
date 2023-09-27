import 'package:dio/dio.dart';
import '../../../../../../config/urls/urls.dart';
import '../../../../../../core/error/http_error_actions.dart';
import '../../../../../../core/network_info/dio_client_service/dio_client_service.dart';
import '../model/request/campaign_request.dart';
import '../model/request/create_campaign_request.dart';
import '../model/request/delete_campaign_request.dart';
import '../model/request/edit_campaign_request.dart';
import '../model/response/campaign_model.dart';
import '../model/response/create_campaign_model.dart';
import '../model/response/delet_campaign_model.dart';
import '../model/response/edit_campaign_model.dart';
import 'campaign_datasource.dart';

class CampaignDataSourceImpl implements CampaignDataSource {
  const CampaignDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<CampaignModel> getCampaign({required CampaignRequest request}) async {
    try {
      Map<String, int> queryParameters = {
        "size": request.size ?? 5,
        "offset": request.offset ?? 1,
      };
      Response response = await dio().get(Urls.campaignUrl, queryParameters: queryParameters);
      if (response.statusCode == 200 && response.data != null) {
        return CampaignModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }

  @override
  Future<CreateCampaignModel> createCampaign({required CreateCampaignRequest request}) async {
    try {
      Response response = await dio().post(Urls.createCampaignUrl + request.id);
      if (response.statusCode == 200 && response.data != null) {
        return CreateCampaignModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }

  @override
  Future<EditCampaignModel> editCampaign({required EditCampaignRequest request}) async {
    try {
      Response response = await dio().put(Urls.editCampaignUrl + request.id);
      if (response.statusCode == 200 && response.data != null) {
        return EditCampaignModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }

  @override
  Future<DeleteCampaignModel> deleteCampaign({required DeleteCampaignRequest request}) async {
    try {
      Response response = await dio().delete(Urls.deleteCampaignUrl + request.id);
      if (response.statusCode == 200 && response.data != null) {
        return DeleteCampaignModel.fromJson(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }
}

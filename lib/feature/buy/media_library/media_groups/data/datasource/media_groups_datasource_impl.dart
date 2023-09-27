import 'package:advedro/core/api_method/api_method.dart';
import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';

import '../model/request/media_groups_request.dart';
import '../model/response/media_groups_model.dart';
import 'media_groups_datasource.dart';

class MediaGroupsDataSourceImpl implements MediaGroupsDataSource {
  const MediaGroupsDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<MediaGroupsModel> fetch({required MediaGroupsRequest request}) async {
    return ApiMethod<MediaGroupsRequest, MediaGroupsModel>(
      dio,
      parser: MediaGroupsModel.fromRawJson,
      request: request,
    ).call();
  }
}

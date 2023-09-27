import 'package:advedro/core/api_method/api_method.dart';
import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';

import '../model/request/medialibraries_request.dart';
import '../model/response/medialibraries_model.dart';
import 'medialibraries_datasource.dart';

class MediaLibrariesDataSourceImpl implements MediaLibrariesDataSource {
  const MediaLibrariesDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<MediaLibrariesModel> fetch({required MediaLibrariesRequest request}) async {
    return ApiMethod<MediaLibrariesRequest, MediaLibrariesModel>(
      dio,
      parser: MediaLibrariesModel.fromRawJson,
      request: request,
    ).call();
  }
}

import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';
import 'package:get/get.dart';
import '../../model/request/medialibraries_request.dart';
import '../../model/response/medialibraries_model.dart';
import '../medialibraries_datasource.dart';
import 'model_sample1.dart';

class MediaLibrariesDataSourceMock implements MediaLibrariesDataSource {
  const MediaLibrariesDataSourceMock({required this.dio});
  final DioClientService dio;

  @override
  Future<MediaLibrariesModel> fetch({required MediaLibrariesRequest request}) async {
    var model = MediaLibrariesModel.fromRawJson(sampleOfMediaLibrariesModel);
    await Future.delayed(3.seconds);
    return Future.value(model);
  }
}

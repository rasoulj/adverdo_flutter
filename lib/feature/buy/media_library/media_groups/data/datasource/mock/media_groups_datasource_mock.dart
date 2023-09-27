import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';
import 'package:get/get.dart';
import '../../model/request/media_groups_request.dart';
import '../../model/response/media_groups_model.dart';
import '../media_groups_datasource.dart';
import 'model_sample1.dart';

class MediaGroupsDataSourceMock implements MediaGroupsDataSource {
  const MediaGroupsDataSourceMock({required this.dio});
  final DioClientService dio;

  @override
  Future<MediaGroupsModel> fetch({required MediaGroupsRequest request}) async {
    var model = MediaGroupsModel.fromRawJson(sampleOfMediaGroupsModel);
    await Future.delayed(3.seconds);
    return Future.value(model);
  }
}

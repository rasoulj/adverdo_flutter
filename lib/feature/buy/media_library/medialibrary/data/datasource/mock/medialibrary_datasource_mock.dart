import 'package:get/get.dart';
import '../../../../../../../core/network_info/dio_client_service/dio_client_service.dart';
import '../../model/request/request.dart';
import '../../model/response/response.dart';
import '../medialibrary_datasource.dart';
import 'model_sample1.dart';

class MediaLibraryDataSourceMock implements MediaLibraryDataSource {
  const MediaLibraryDataSourceMock({required this.dio});
  final DioClientService dio;

  @override
  Future<MediaLibraryModel> fetch({required MediaLibraryRequest request}) async {
    var model = MediaLibraryModel.fromRawJson(sampleOfMediaLibraryModel);
    await Future.delayed(3.seconds);
    return Future.value(model);
  }

  @override
  Future<CreateAdResponse> createAd({required CreateAdRequest request}) async {
    var model = CreateAdResponse.fromRawJson(sampleOfCreateMediaLibrary);
    await Future.delayed(3.seconds);
    return Future.value(model);
  }

  @override
  Future<CallToActionsResponse> fetchCallToActions({required CallToActionsRequest request}) async {
    var model = CallToActionsResponse.fromRawJson(sampleOfCta);
    await Future.delayed(3.seconds);
    return Future.value(model);
  }

  @override
  Future<ChangeTagsResponse> changeTags({required ChangeTagsRequest request}) async {
    var model = ChangeTagsResponse.fromRawJson(sampleOfChangeTags);
    await Future.delayed(3.seconds);
    return Future.value(model);
  }

  @override
  Future<DeleteResponse> deleteMediaLibrary({required DeleteRequest request}) async {
    var model = DeleteResponse.fromRawJson(sampleOfDeleteLibrary);
    await Future.delayed(3.seconds);
    return Future.value(model);
  }
}

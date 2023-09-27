import 'package:advedro/core/api_method/api_method.dart';
import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';


import '../model/request/request.dart';
import '../model/response/response.dart';
import 'medialibrary_datasource.dart';


class MediaLibraryDataSourceImpl implements MediaLibraryDataSource {
  const MediaLibraryDataSourceImpl({required this.dio});
  final DioClientService dio;

  @override
  Future<MediaLibraryModel> fetch({required MediaLibraryRequest request}) {
    return ApiMethod<MediaLibraryRequest, MediaLibraryModel>(
      dio,
      parser: MediaLibraryModel.fromRawJson,
      request: request,
    ).call();
  }

  @override
  Future<CreateAdResponse> createAd({required CreateAdRequest request}) {
    return ApiMethod<CreateAdRequest, CreateAdResponse>(
      dio,
      parser: CreateAdResponse.fromRawJson,
      request: request,
    ).call();
  }

  @override
  Future<CallToActionsResponse> fetchCallToActions({required CallToActionsRequest request}) {
    return ApiMethod<CallToActionsRequest, CallToActionsResponse>(
      dio,
      parser: CallToActionsResponse.fromRawJson,
      request: request,
    ).call();
  }

  @override
  Future<ChangeTagsResponse> changeTags({required ChangeTagsRequest request}) {
    return ApiMethod<ChangeTagsRequest, ChangeTagsResponse>(
      dio,
      parser: ChangeTagsResponse.fromRawJson,
      request: request,
    ).call();
  }

  @override
  Future<DeleteResponse> deleteMediaLibrary({required DeleteRequest request}) {
    return ApiMethod<DeleteRequest, DeleteResponse>(
      dio,
      parser: DeleteResponse.fromRawJson,
      request: request,
    ).call();
  }
}

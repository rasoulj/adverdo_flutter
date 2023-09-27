
import '../model/request/request.dart';
import '../model/response/response.dart';

abstract class MediaLibraryDataSource {
  Future<MediaLibraryModel> fetch({required MediaLibraryRequest request});

  Future<CreateAdResponse> createAd({required CreateAdRequest request});

  Future<CallToActionsResponse> fetchCallToActions({required CallToActionsRequest request});

  Future<ChangeTagsResponse> changeTags({required ChangeTagsRequest request});

  Future<DeleteResponse> deleteMediaLibrary({required DeleteRequest request});

}

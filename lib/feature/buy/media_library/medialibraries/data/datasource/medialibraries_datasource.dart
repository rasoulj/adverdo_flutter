
import '../model/request/medialibraries_request.dart';
import '../model/response/medialibraries_model.dart';

abstract class MediaLibrariesDataSource {
  Future<MediaLibrariesModel> fetch({required MediaLibrariesRequest request});
}

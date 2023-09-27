

import '../model/request/media_groups_request.dart';
import '../model/response/media_groups_model.dart';

abstract class MediaGroupsDataSource {
  Future<MediaGroupsModel> fetch({required MediaGroupsRequest request});
}

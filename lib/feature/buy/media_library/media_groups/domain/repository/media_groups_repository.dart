
import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/media_groups_request.dart';
import '../../data/model/response/media_groups_model.dart';

abstract class MediaGroupsRepository {
  Future<Either<Failure, MediaGroupsModel>> fetch({required MediaGroupsRequest request});
}

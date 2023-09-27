import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/media_groups_request.dart';
import '../../data/model/response/media_groups_model.dart';
import '../repository/media_groups_repository.dart';

class MediaGroupsUseCase {
  const MediaGroupsUseCase({required this.repository});
  final MediaGroupsRepository repository;

  Future<Either<Failure, MediaGroupsModel>> call({required MediaGroupsRequest request}) async {
    var result = await repository.fetch(request: request);
    return result;
  }
}

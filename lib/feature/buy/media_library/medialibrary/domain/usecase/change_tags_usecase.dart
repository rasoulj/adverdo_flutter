import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/request.dart';
import '../../data/model/response/response.dart';
import '../repository/medialibrary_repository.dart';

class ChangeTagsCase {
  const ChangeTagsCase({required this.repository});
  final MediaLibraryRepository repository;

  Future<Either<Failure, ChangeTagsResponse>> call({required ChangeTagsRequest request}) async {
    var result = await repository.changeTags(request: request);
    return result;
  }
}

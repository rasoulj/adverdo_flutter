import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/medialibraries_request.dart';
import '../../data/model/response/medialibraries_model.dart';
import '../repository/medialibraries_repository.dart';

class MediaLibrariesUseCase {
  const MediaLibrariesUseCase({required this.repository});
  final MediaLibrariesRepository repository;

  Future<Either<Failure, MediaLibrariesModel>> call({required MediaLibrariesRequest request}) async {
    var result = await repository.fetch(request: request);
    return result;
  }
}

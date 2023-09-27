
import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/medialibraries_request.dart';
import '../../data/model/response/medialibraries_model.dart';

abstract class MediaLibrariesRepository {
  Future<Either<Failure, MediaLibrariesModel>> fetch({required MediaLibrariesRequest request});
}

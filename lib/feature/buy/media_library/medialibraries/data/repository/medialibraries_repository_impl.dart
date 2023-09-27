import 'package:advedro/core/error/exceptions.dart';
import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/medialibraries_repository.dart';
import '../datasource/medialibraries_datasource.dart';
import '../model/request/medialibraries_request.dart';
import '../model/response/medialibraries_model.dart';

class MediaLibrariesRepositoryImpl implements MediaLibrariesRepository {
  const MediaLibrariesRepositoryImpl({required this.dataSource});
  final MediaLibrariesDataSource dataSource;

  @override
  Future<Either<Failure, MediaLibrariesModel>> fetch({required MediaLibrariesRequest request}) async {
    try {
      var result = await dataSource.fetch(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

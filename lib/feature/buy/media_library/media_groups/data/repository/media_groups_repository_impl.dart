import 'package:advedro/core/error/exceptions.dart';
import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/media_groups_repository.dart';
import '../datasource/media_groups_datasource.dart';
import '../model/request/media_groups_request.dart';
import '../model/response/media_groups_model.dart';

class MediaGroupsRepositoryImpl implements MediaGroupsRepository {
  const MediaGroupsRepositoryImpl({required this.dataSource});
  final MediaGroupsDataSource dataSource;

  @override
  Future<Either<Failure, MediaGroupsModel>> fetch({required MediaGroupsRequest request}) async {
    try {
      var result = await dataSource.fetch(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }
}

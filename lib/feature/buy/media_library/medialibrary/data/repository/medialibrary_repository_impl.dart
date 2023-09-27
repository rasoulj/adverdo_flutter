import 'package:advedro/core/error/exceptions.dart';
import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/medialibrary_repository.dart';
import '../datasource/medialibrary_datasource.dart';
import '../model/request/request.dart';
import '../model/response/response.dart';

class MediaLibraryRepositoryImpl implements MediaLibraryRepository {
  const MediaLibraryRepositoryImpl({required this.dataSource});
  final MediaLibraryDataSource dataSource;

  @override
  Future<Either<Failure, MediaLibraryModel>> fetch({required MediaLibraryRequest request}) async {
    try {
      var result = await dataSource.fetch(request: request);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(serverException: e));
    }
  }

  @override
  Future<Either<Failure, CreateAdResponse>> createAd({required CreateAdRequest request}) async {
    if (!request.isValid) {
      return left(const GeneralFailure(message: "request is not valid"));
    }
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CallToActionsResponse>> fetchCallToActions({required CallToActionsRequest request}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ChangeTagsResponse>> changeTags({required ChangeTagsRequest request}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, DeleteResponse>> deleteMediaLibrary({required DeleteRequest request}) {
    throw UnimplementedError();
  }
}

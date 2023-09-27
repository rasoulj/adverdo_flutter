import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../data/model/request/request.dart';
import '../../data/model/response/response.dart';

abstract class MediaLibraryRepository {
  Future<Either<Failure, MediaLibraryModel>> fetch({required MediaLibraryRequest request});

  Future<Either<Failure, CreateAdResponse>> createAd({required CreateAdRequest request});

  Future<Either<Failure, CallToActionsResponse>> fetchCallToActions({required CallToActionsRequest request});

  Future<Either<Failure, ChangeTagsResponse>> changeTags({required ChangeTagsRequest request});

  Future<Either<Failure, DeleteResponse>> deleteMediaLibrary({required DeleteRequest request});
}

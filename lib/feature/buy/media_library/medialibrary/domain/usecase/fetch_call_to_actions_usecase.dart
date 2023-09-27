import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/request.dart';
import '../../data/model/response/response.dart';
import '../repository/medialibrary_repository.dart';

class FetchCallToActionsUseCase {
  const FetchCallToActionsUseCase({required this.repository});
  final MediaLibraryRepository repository;

  Future<Either<Failure, CallToActionsResponse>> call({required CallToActionsRequest request}) async {
    var result = await repository.fetchCallToActions(request: request);
    return result;
  }
}

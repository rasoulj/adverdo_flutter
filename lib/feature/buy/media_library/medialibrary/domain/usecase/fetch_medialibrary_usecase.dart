import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/request.dart';
import '../../data/model/response/response.dart';
import '../repository/medialibrary_repository.dart';

class FetchMediaLibraryUseCase {
  const FetchMediaLibraryUseCase({required this.repository});
  final MediaLibraryRepository repository;

  Future<Either<Failure, MediaLibraryModel>> call({required MediaLibraryRequest request}) async {
    var result = await repository.fetch(request: request);
    return result;
  }
}

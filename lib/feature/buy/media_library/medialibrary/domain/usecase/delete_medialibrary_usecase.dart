import 'package:advedro/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/request.dart';
import '../../data/model/response/response.dart';
import '../repository/medialibrary_repository.dart';

class DeleteMediaLibraryUseCase {
  const DeleteMediaLibraryUseCase({required this.repository});
  final MediaLibraryRepository repository;

  Future<Either<Failure, DeleteResponse>> call({required DeleteRequest request}) async {
    var result = await repository.deleteMediaLibrary(request: request);
    return result;
  }
}

import 'package:advedro/core/error/failures.dart';
import 'package:advedro/feature/buy/media_library/medialibrary/data/model/response/create_ad_response.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/request/request.dart';
import '../../data/model/response/response.dart';
import '../repository/medialibrary_repository.dart';

class CreateAdUseCase {
  const CreateAdUseCase({required this.repository});
  final MediaLibraryRepository repository;

  Future<Either<Failure, CreateAdResponse>> call({required CreateAdRequest request}) async {
    var result = await repository.createAd(request: request);
    return result;
  }
}

import 'package:advedro/core/data/models/request_base.dart';

class MediaLibraryRequest extends RequestBase {
  const MediaLibraryRequest({
    required this.id,
  });

  final String id;

  @override
  String get requestUrl => "/buy/medialibraries/$id";
}

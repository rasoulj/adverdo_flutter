import 'package:advedro/core/data/models/request_base.dart';

class MediaLibrariesRequest extends RequestBase {
  const MediaLibrariesRequest({
    required this.size,
    required this.request,
  });

  final int size;
  final int request;

  @override
  String get requestUrl => "/buy/medialibraries";
}

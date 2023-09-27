import 'package:advedro/core/data/models/request_base.dart';

class MediaGroupsRequest extends RequestBase {
  const MediaGroupsRequest({
    required this.size,
    required this.request,
  });

  final int size;
  final int request;

  @override
  String get requestUrl => "/buy/media_groups";
}

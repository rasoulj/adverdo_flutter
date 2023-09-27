import 'package:advedro/core/data/enums/method_actions_enum.dart';
import 'package:advedro/core/data/models/request_base.dart';

class DeleteRequest extends RequestBase {
  final String id;

  const DeleteRequest({required this.id});

  @override
  MethodActionsEnum get method => MethodActionsEnum.delete;

  @override
  String get requestUrl => "/buy/medialibraries/$id";
}

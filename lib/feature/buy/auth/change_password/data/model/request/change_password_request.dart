import 'package:advedro/core/data/models/request_base.dart';

class ChangePasswordRequest extends RequestBase {
  const ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;

  @override
  String get requestUrl => throw UnimplementedError();
}

import 'package:advedro/core/data/models/request_base.dart';

class AccountDetailRequest extends RequestBase {
  const AccountDetailRequest({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;

  @override
  String get requestUrl => throw UnimplementedError();
}

import 'package:advedro/config/consts/consts.dart';
import 'package:get_storage/get_storage.dart';

mixin TokenManager {
  Future<void> saveToken(String token) async {
    final GetStorage box = GetStorage();
    box.write(tokenKey, token);
  }

  bool hasToken() {
    final GetStorage box = GetStorage();
    String token = box.read(tokenKey) ?? string;
    if (token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  String token() {
    final GetStorage box = GetStorage();
    return box.read(tokenKey) ?? string;
  }

  bool isRemovedToken() {
    final GetStorage box = GetStorage();
    box.remove(tokenKey);
    if (!hasToken()) {
      return true;
    } else {
      return false;
    }
  }
}

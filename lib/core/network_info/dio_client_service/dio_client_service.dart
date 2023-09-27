import 'package:dio/dio.dart';
import '../../../config/urls/urls.dart';
import '../interceptor/interceptors.dart';

class DioClientService {
  late Dio client;
  DioClientService() {
    client = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        sendTimeout: 10000,
      ),
    );
    client.interceptors.add(AppInterceptors());
  }

  Dio call() {
    var c = client;
    return c;
  }
}

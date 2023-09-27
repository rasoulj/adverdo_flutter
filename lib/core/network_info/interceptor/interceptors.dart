import 'package:advedro/core/utils/logger/logger.dart';
import 'package:advedro/core/utils/token_manager/token_manager.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor with TokenManager {
  final logger = Logger('Logger');

  @override
  Future<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Accept"] = "application/json";
    options.headers["Content-Type"] = "application/json";
    options.headers["Authorization"] = "Basic aG1vdXNhdmk6ZFtON2hpVTxRdzs6Ww==";
    // options.headers["Authorization"] = "Bearer $userToken";
    // if (!isHasToken()) {
    //   return handler.next(options);
    // } else {
    //   String userToken = token();
    //   options.headers["Authorization"] = "Bearer $userToken";
    // }
    logger.onRequestLogger(logger, options);
    return handler.next(options);
  }

  @override
  Future<dynamic> onError(DioError err, ErrorInterceptorHandler handler) async {
    logger.onErrorLogger(logger, err);
    return handler.next(err);
  }

  @override
  Future<dynamic> onResponse(Response response, ResponseInterceptorHandler handler) async {
    logger.onResponseLogger(logger, response);
    return handler.next(response);
  }
}

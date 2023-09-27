import 'dart:developer' as developer;

import 'package:dio/dio.dart';

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      developer.log(msg, name: name);
    }
  }

  void onRequestLogger(Logger logger, RequestOptions options) {
    try {
      logger.log('REQUEST URI: ${options.uri}');
      logger.log('REQUEST MODE: ${options.method}');
      logger.log('REQUEST DATA: ${options.data}');
      logger.log('REQUEST PARAMETERS: ${options.queryParameters}');
      logger.log('REQUEST HEADERS: ${options.headers}');
    } catch (e) {
      logger.log('error: $e');
    }
  }

  void onResponseLogger(Logger logger, Response response) {
    try {
      logger.log('\x1B[32mRESPONSE URI : ${response.requestOptions.uri}\x1B[0m');
      logger.log('\x1B[32mRESPONSE MODE: ${response.requestOptions.method}\x1B[0m');
      logger.log('\x1B[32mRESPONSE STATUS_CODE: ${response.statusCode}\x1B[0m');
      logger.log('\x1B[32mRESPONSE DATA: ${response.data}\x1B[0m');
    } catch (e) {
      logger.log('error: $e');
    }
  }

  void onErrorLogger(Logger logger, DioError err) {
    try {
      logger.log('\x1B[31mERROR URI: ${err.requestOptions.uri}\x1B[0m');
      logger.log('\x1B[31mERROR MODE: ${err.requestOptions.method}\x1B[0m');
      logger.log('\x1B[31mERROR STATUS_CODE: ${err.response?.statusCode}\x1B[0m');
      logger.log('\x1B[31mERROR MESSAGE: ${err.response?.data}\x1B[0m');
    } catch (e) {
      logger.log('error: $e');
    }
  }
}

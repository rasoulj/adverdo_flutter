import 'package:dio/dio.dart';
import 'exceptions.dart';

extension OnDioError on DioError {
  void action(DioError e) {}
}

class OnDioErrorActions {
  OnDioErrorActions({required DioError exception, required StackTrace stackTrace}) {
    HttpErrorActions(exception: exception, stackTrace: stackTrace);
  }
}

class HttpErrorActions {
  HttpErrorActions({required DioError exception, required StackTrace stackTrace}) {
    throw ServerException(
      message: exception.message,
      exception: exception,
      fieldErrors: null,
      nonFieldError: exception.error,
      uiVisible: false,
    );
  }
}

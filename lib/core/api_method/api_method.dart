import 'package:advedro/core/data/enums/method_actions_enum.dart';
import 'package:advedro/core/error/http_error_actions.dart';
import 'package:advedro/core/network_info/dio_client_service/dio_client_service.dart';
import 'package:advedro/core/data/models/request_base.dart';
import 'package:advedro/core/data/models/response_base.dart';
import 'package:dio/dio.dart';

class ApiMethod<Req extends RequestBase, Res extends ResponseBase> {
  final DioClientService dio;
  final Req request;
  final Res Function(String) parser;

  const ApiMethod(
    this.dio, {
    required this.parser,
    required this.request,
  });

  Future<Res> call() async {
    try {
      Response? response;
      switch (request.method) {
        case MethodActionsEnum.get:
          response = await dio().get(
            request.requestUrl,
            queryParameters: request.requestQueryParameters,
          );
          break;
        case MethodActionsEnum.post:
          response = await dio().post(
            request.requestUrl,
            queryParameters: request.requestQueryParameters,
            data: request.requestBody,
          );
          break;
        case MethodActionsEnum.delete:
          response = await dio().delete(
            request.requestUrl,
            data: request.requestBody,
            queryParameters: request.requestQueryParameters,
          );
          break;
        case MethodActionsEnum.put:
          response = await dio().put(
            request.requestUrl,
            data: request.requestBody,
            queryParameters: request.requestQueryParameters,
          );
          break;
      }
      if (response.statusCode == 200 && response.data != null) {
        return parser(response.data);
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e, s) {
      OnDioErrorActions(exception: e, stackTrace: s);
      throw Exception(e.error);
    }
  }
}

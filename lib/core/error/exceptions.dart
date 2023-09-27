import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServerException implements Exception {
  final DioError? exception;
  final String? nonFieldError;
  final Map<String, String>? fieldErrors;
  final String? message;
  final String? detail;
  final bool? uiVisible;

  ServerException({
    this.exception,
    this.nonFieldError,
    this.fieldErrors,
    this.message,
    this.detail,
    @required this.uiVisible,
  });
}

class CacheException implements Exception {
  final String? message;

  CacheException({this.message});
}

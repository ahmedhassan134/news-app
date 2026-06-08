import 'dart:developer';

import 'package:dio/dio.dart';

class DioInterceptors implements Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    log(options.baseUrl);
    log(options.uri.toString());
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    log(response.statusCode.toString());
    log(response.data);
    log(response.statusMessage.toString());

   handler.next(response);

  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String handleDioError(DioException e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection timeout';
        case DioExceptionType.sendTimeout:
          return 'Send timeout';
        case DioExceptionType.receiveTimeout:
          return 'Receive timeout';
        case DioExceptionType.badResponse:
          return 'Server error: ${e.response?.statusCode}';
        case DioExceptionType.cancel:
          return 'Request cancelled';
        case DioExceptionType.unknown:
          return 'Check your internet connection';
        default:
          return 'Unexpected error';
      }
    }
    handler.next(err);
  }
 }
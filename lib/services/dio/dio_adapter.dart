import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/service_container.dart';
import 'package:moniepoint/services/services.dart';

class DioAdapter {
  static Future<Dio> get make async {
    final sc = SC.get;
    final dio = Dio(
      BaseOptions(
        connectTimeout: AppConstants.requestDuration,
        receiveTimeout: AppConstants.requestDuration,
        sendTimeout: AppConstants.requestDuration,
        baseUrl: Env.prod.httpBaseUrl,
        headers: <String, dynamic>{
          'fcmtoken': "fcmToken",
          'idempotency-key': "${Random().nextInt(44444)}",
        },
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onError: _onError,
        ),
      );
    dio.interceptors.add(TokenInterceptor());
    return dio;
  }

  static void _onError(DioException err, ErrorInterceptorHandler handler) {
    final message = err.message;
    final res = err.response;
    final response = DioHttpResponse(
      data: res?.data,
      statusCode: res?.statusCode,
      statusMessage: res?.statusMessage,
    );
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeOutException(message: message, response: response);
      case DioExceptionType.badResponse:
        switch (response.statusCode) {
          case HttpStatus.badRequest:
            throw BadRequestException(message: message, response: response);
          case HttpStatus.unauthorized:
            throw UnauthrizedException(message: message, response: response);
          case HttpStatus.notFound:
            throw NotFoundException(message: message, response: response);
          case 403:
            throw DeviceException(message: message, response: response);
          case HttpStatus.unprocessableEntity:
            throw AppException(message: message, response: response);
          case 500:
            throw AppException(message: message, response: response);
          default:
            throw AppException(message: message, response: response);
        }
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NotInternetException(message: message, response: response);
    }
    return handler.next(err);
  }
}

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Authorization"] = "Bearer ";
    super.onRequest(options, handler);
  }
}

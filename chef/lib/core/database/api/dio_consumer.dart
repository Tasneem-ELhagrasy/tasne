import 'package:chef/core/errors/error_model.dart';
import 'package:chef/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'api_consumer.dart';
import 'api_interceptors.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterCeptors());
    dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res;
    } on DioException catch (e) {
      handleExceptions(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res;
    } on DioException catch (e) {
      handleExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res;
    } on DioException catch (e) {
      handleExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res;
    } on DioException catch (e) {
      handleExceptions(e);
    }
  }
}

handleExceptions(e) {
  switch (e) {
    case DioExceptionType.badCertificate:
      throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //Bad Request
          throw BadRequestException(ErrorModel.fromJson(e.response!.data));
        case 401: // unauthorized
          throw UnauthorizedException(ErrorModel.fromJson(e.response!.data));
        case 403: // forbbiden
          throw ForbbidenException(ErrorModel.fromJson(e.response!.data));
        case 404: // not found
          throw NotFoundException(ErrorModel.fromJson(e.response!.data));
        case 409: // conflict
          throw ConflictException(ErrorModel.fromJson(e.response!.data));
      }
    case DioExceptionType.cancel:
      throw CancelException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ConnectionErrorException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw SendTimeoutException(ErrorModel.fromJson(e.response!.data));
    default:
      throw ServerExceptions(ErrorModel.fromJson(e.response!.data));
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tut_app/core/services/errors/exceptions.dart';
import 'package:tut_app/core/services/networking/api_consumer.dart';
import 'package:tut_app/core/services/networking/api_interceptor.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer._({
    required this.dio,
  }) {
    /// add interceptors
    dio.interceptors.add(
      ApiInterceptor(),
    );
    if (!kReleaseMode) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }

  /// wwe use singleton design pattern to ensure only one instance is used
  /// and ease dependency injection.
  factory DioConsumer() => DioConsumer._(dio: Dio());
  @override
  Future post({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    void Function(int p1, String p2)? cancelToken,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(body!) : body,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future delete({
    required String path,
    bool isFormData = false,
  }) async {
    try {
      await dio.delete(path);
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch({
    required String path,
    Map<String, dynamic>? body,
    bool isFormData = false,
  }) async {
    try {
      await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(body!) : body,
      );
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}

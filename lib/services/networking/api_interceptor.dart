import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// This class represents an Observer for api requests and intercepts the request to do a specific action.
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('This Dio interceptor for Request Logs');
    super.onRequest(options, handler);
  }
}

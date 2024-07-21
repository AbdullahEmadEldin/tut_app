import 'package:dio/dio.dart';

/// This class repersents an Observer for api requests and intercepts the request to do a specific action.
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('This is test');
    super.onRequest(options, handler);
  }
}

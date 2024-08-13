import 'package:dio/dio.dart';
import 'package:tut_app/constants/api_endpoints.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';

/// This class represents an Observer for api requests and intercepts the request to do a specific action.
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.token] = CacheHelper.getData(
                key: AppConstants.sharedPrefKeys.token) !=
            null
        ? 'FOODAPI ${CacheHelper.getData(key: AppConstants.sharedPrefKeys.token)}' // this from determined from the api docs.
        : null;
    super.onRequest(options, handler);
  }
}

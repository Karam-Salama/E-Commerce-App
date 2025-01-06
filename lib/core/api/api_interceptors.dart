import 'package:dio/dio.dart';

import '../cache/cache_helper.dart';
import '../services/service_locator.dart';
import 'end_ponits.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = getIt<CacheHelper>().getData(key: ApiKey.token);

    // ! Needed Headers For My Requests
    options.headers[ApiKey.authorization] = token;
    options.headers[ApiKey.lang] = 'en';

    super.onRequest(options, handler);
  }
}

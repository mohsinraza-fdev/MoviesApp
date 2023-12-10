import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ten_twenty_test/app/service_locator/locator.dart';
import 'package:ten_twenty_test/network/api_headers.dart';
import 'package:ten_twenty_test/services/preference_service.dart';
import 'package:ten_twenty_test/shared/helpers/utils.dart';

class OnRequestInterceptor extends Interceptor {
  final preferenceService = locator<PreferenceService>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = preferenceService.accessToken;
    if (token != null) {
      options.headers.addAll({
        ApiHeaders.accessToken: 'Bearer $token',
      });
    }
    options.queryParameters.addAll({
      "api_key": "03e05b905cd7b239e3d78422c0794670",
    });
    log('ApiClient - Post - Request\nEndpoint:${options.path}');
    log('--> REQUEST HEADERS <--');
    logJson(options.headers);
    log('--> REQUEST BODY <--');
    logJson(options.data);
    super.onRequest(options, handler);
  }
}

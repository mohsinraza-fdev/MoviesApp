import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ten_twenty_test/network/exceptions.dart';
import 'package:ten_twenty_test/shared/helpers/utils.dart';

class OnErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError) {
      log('onErrorInterceptor - Connection Error\nEndpoint: ${err.requestOptions.path}');
      handler.next(
        err.copyWith(
          error: ClientException(
            message: 'connection_timed_out',
            statusCode: err.response?.statusCode ?? -1,
            responseData: err.response?.data,
          ),
        ),
      );
      return;
    }
    if (err.type == DioExceptionType.cancel) {
      log('onErrorInterceptor - Request Cancelled\nEndpoint: ${err.requestOptions.path}');
      handler.next(
        err.copyWith(
          error: const CancelTokenException(message: 'request_cancelled'),
        ),
      );
      return;
    }
    if (err.type == DioExceptionType.badResponse) {
      if (err.response!.data is Map<String, dynamic>) {
        log('onErrorInterceptor - Valid Response\nEndpoint: ${err.requestOptions.path}\nStatusCode: ${err.response?.statusCode}');
        log('--> REQUEST HEADERS <--');
        logJson(err.requestOptions.headers);
        log('--> REQUEST BODY <--');
        logJson(err.requestOptions.data);
        log('--> RESPONSE BODY <--');
        logJson(err.response?.data ?? '<null>');

        handler.next(
          err.copyWith(
            error: ServerException(
              message:
                  err.response?.data['status_message'] ?? 'invalid_error_code',
              statusCode: err.response?.statusCode ?? -1,
              responseData: err.response?.data,
            ),
          ),
        );
        return;
      }
      log('onErrorInterceptor - Invalid Response\nEndpoint: ${err.requestOptions.path}\nStatusCode: ${err.response?.statusCode}\nMessage: ${err.message}');
      log('--> REQUEST HEADERS <--');
      logJson(err.requestOptions.headers);
      log('--> REQUEST BODY <--');
      logJson(err.requestOptions.data);
      log('--> RESPONSE BODY<--');
      logJson(err.response?.data ?? '<null>');

      handler.next(
        err.copyWith(
          error: ClientException(
            message: "something_went_wrong",
            statusCode: err.response?.statusCode ?? -1,
          ),
        ),
      );
      return;
    }
    log('onErrorInterceptor - Unknown Error -> ${err.response?.statusCode} - ${err.message}');
    super.onError(
      err.copyWith(
        error: ClientException(
          message: "something_went_wrong",
          statusCode: err.response?.statusCode ?? -1,
        ),
      ),
      handler,
    );
  }
}

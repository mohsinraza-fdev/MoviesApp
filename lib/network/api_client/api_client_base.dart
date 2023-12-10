import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ten_twenty_test/network/api_client/client_utils.dart';

import '../interceptors/on_error_interceptor.dart';
import '../interceptors/on_request_interceptor.dart';
import '../interceptors/on_response_interceptor.dart';

abstract class ApiClientBase {
  String get baseUrl;
  Duration get defaultConnectTimeout;
  Duration get defaultReceiveTimeout;

  @protected
  final Dio client;
  ApiClientBase(this.client);

  void initialise() {
    client.options
      ..baseUrl = baseUrl
      ..validateStatus = isStatusCodeValid
      ..connectTimeout = defaultConnectTimeout
      ..receiveTimeout = defaultReceiveTimeout;
    client.interceptors.addAll([
      OnRequestInterceptor(),
      OnResponseInterceptor(),
      OnErrorInterceptor(),
    ]);
  }

  @protected
  Future<T?> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  @protected
  Future<T?> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  @protected
  Future<T?> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  @protected
  Future<T?> patch<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });
}

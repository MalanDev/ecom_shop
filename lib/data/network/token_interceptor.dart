import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TokenInterceptor extends Interceptor {
  final Dio _dio;
  final String? _refreshToken;

  TokenInterceptor(
    this._dio,
    this._refreshToken,
  );

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    // Add the access token to the request header
    options.headers['Authorization'] = 'Bearer $_refreshToken';
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      // If a 401 response is received, refresh the access token
      String newAccessToken = await refreshToken();

      // Update the request header with the new access token
      err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

      // Repeat the request with the updated header
      return handler.resolve(await _dio.fetch(err.requestOptions));
    }
    return handler.next(err);
  }

  Future<String> refreshToken() async {
    try {
      // Make a request to refresh the token
      final response = await _dio
          .post('/refresh_token', data: {'refresh_token': _refreshToken});
      // Extract and return the new token
      return response.data['access_token'];
    } catch (e) {
      // Handle token refresh failure
      throw Exception('Failed to refresh token: $e');
    }
  }
}

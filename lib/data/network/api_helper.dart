import 'package:dio/dio.dart';
import 'package:ecom_shop/helper/constatnts.dart';
import 'token_interceptor.dart';

class ApiHelper {
  static String? refreshToken = "";
  static final Dio _client = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        "Tz": "Europe / London",
      },
    ),
  )
    ..interceptors.add(TokenInterceptor(_client, refreshToken))
    ..interceptors.add(LogInterceptor());

  static Future<Response> post(
      {required String urlPath, required FormData data}) async {
    final Response response = await _client.post(
      urlPath,
      data: data,
    );

    return response;
  }

  static Future<Response> postAsJson(
      {required String urlPath, required String data}) async {
    final Response response = await _client.post(
      urlPath,
      data: data,
    );

    return response;
  }

  static Future<Response> get(String urlPath) async {
    final Response response = await _client.get(
      urlPath,
    );

    return response;
  }
}

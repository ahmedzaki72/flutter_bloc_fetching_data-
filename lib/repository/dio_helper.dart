import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getAllData({
    @required url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'Authorization': "Bearer " + token!,
    };

    return await dio!.get(url, queryParameters: query ?? null);
  }

  static Future<Response> getData({
    @required url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
    };
    return await dio!.get(url, queryParameters: query ?? null);
  }

  static Future<Response> postDat({
    @required url,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'Authorization': token ?? '',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
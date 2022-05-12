import 'dart:developer';

import 'package:dio/dio.dart';

class DioMethod {
  static final Dio _dio = Dio();

  static Future<Map<String, dynamic>?> getMethod(
      {required String url, Map<String, dynamic>? data}) async {
    Map<String, dynamic>? responseMap;
    try {
      Response? response = await _dio.get(
        url,
        queryParameters: data,
        options: Options(
          headers: {
            "content-type": "application/json",
            "accept": "application/json"
          },
        ),
      );
      responseMap = response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        log("Dio error!");
      } else {
        log("Error sending request");
      }
    }
    return responseMap;
  }

  static Future<Map<String, dynamic>?> postMethod({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    Map<String, dynamic>? responseMap;
    try {
      Response response = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            "content-type": "application/json",
            "accept": "application/json"
          },
        ),
      );
      responseMap = response.data;
      log("responseMap + $url " + responseMap.toString());
      log("resquest " + data.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        log("Dio error!");
        log(e.message.toString());
        log(e.response.toString());
      } else {
        log("Error sending request");
      }
    }
    return responseMap;
  }
}

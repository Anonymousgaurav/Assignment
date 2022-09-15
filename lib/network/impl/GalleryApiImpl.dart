import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class GalleryApiImpl {
  static Future<dynamic>? getData({
    required String url,
    required BaseOptions options,
    dynamic body,
  }) async {
    var dio = Dio(options);
    try {
      var response = await dio.request(
        url,
        data: body,
      );
      return response.data;
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }
}

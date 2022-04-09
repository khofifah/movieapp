import 'dart:convert';

import 'package:dio/dio.dart';

Future<Response> getApi(String url) async {
  var dio = Dio();
  final response = await dio.get(url);
  return response;
}

Future<Response> postApi(String url, Map data) async {
  var dio = Dio();
  final response = await dio.post(
    url,
    data: jsonEncode(data),
  );
  return response;
}

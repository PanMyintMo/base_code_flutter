import 'package:base_code_flutter/core/network/base_api_client.dart';
import 'package:dio/dio.dart';


class ApiClient extends BaseApiClient {
  final Dio dio;
  ApiClient(this.dio);
  @override
  Future<Response> delete(String path) {
    return dio.delete(path);
  }

  @override
  Future<Response> get(String path) {
    return dio.get(path);
  }

  @override
  Future<Response> post(String path, Map<String, dynamic> body) {
    return dio.post(path, data: body);
  }

  @override
  Future<Response> put(String path, Map<String, dynamic> body) {
    return dio.put(path, data: body);
  }
}

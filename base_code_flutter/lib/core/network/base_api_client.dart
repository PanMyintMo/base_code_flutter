import 'package:dio/dio.dart';

abstract class BaseApiClient {
  Future<Response> get(String path);
  Future<Response> post(String path, Map<String, dynamic> body);
  Future<Response> delete(String path);
  Future<Response> put(String path, Map<String, dynamic> body);
}

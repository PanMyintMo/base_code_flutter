import 'package:dio/dio.dart';

class DioClient {
  static Dio create({String? baseUrl, Map<String, String>? header}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? 'https://api.example.com',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: Duration(seconds: 15),
        headers: header,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (DioError error, handler) {
          return handler.next(error);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),
    );

    return dio;
  }
}

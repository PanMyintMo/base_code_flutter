import 'dart:io';
import 'package:base_code_flutter/core/constants/api_constant.dart';
import 'package:base_code_flutter/core/network/token_inteceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


// dio di with riverpod
final dioProvider = Provider<Dio>((ref) => DioProvider().init());

class DioProvider {
  Dio dio = Dio();

  /// for proxy-man
  String proxy = Platform.isAndroid ? '<YOUR_LOCAL_IP>:9090' : 'localhost:9090';

  Dio init() {
    if (kDebugMode) {
      final prettyDioLogger = PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: false,
        error: true,
        compact: true,
      );
      dio.interceptors.add(prettyDioLogger);
    }

    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 60),
      headers: {"Accept": "application/json"},
      baseUrl: ApiConst.baseUrl,
    );
    dio.interceptors.add(TokenInterceptor());

    return dio;
  }
}
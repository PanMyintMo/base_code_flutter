import 'package:base_code_flutter/core/util/logger.dart';
import 'package:base_code_flutter/features/user/data/models/base_response_model.dart';
import 'package:dio/dio.dart';


class BaseApiServices {
  final Dio dio;

  BaseApiServices({required this.dio});


  Future<T> getServerCall<T extends BaseResponseModel>(T obj,
    String serviceName, {
    bool useHeaderToken = false,
    String? headerToken,
    String? lang,
    Map<String, dynamic>? queryParameters = const {},
    Map<String, dynamic>? body = const {},
     }) async{

final response = await dio.get(
     "/appapi/",
      queryParameters: {
        "service": serviceName,
      
        ...?queryParameters
      },
      // data: body,
    );
    return obj.fromJson(response.data);

 }

Future<T> postServerCall<T extends BaseResponseModel>(
    T obj,
    String serviceName, {
    bool useHeaderToken = false,
    String? headerToken,
    Map<String, dynamic>? body = const {},
    Map<String, dynamic>? queryParameters = const {},
    FormData? formData,
  }) async {
    try {
      final uri = "/appapi/";

      final response = await dio.post(
        uri,
        data: formData ?? body,
        queryParameters: {
          "service": serviceName,
      
          ...?queryParameters
        },
      );

      logger.d("POST uri: $uri?service=$serviceName");
      logger.d("POST response: ${response.data}");

      return obj.fromJson(response.data);
    } on DioException catch (e) {
      logger.e("DioException in postServerCall: $e");
      rethrow;
    } catch (e) {
      logger.e("Exception in postServerCall: $e");
      rethrow;
    }
  }

  /// PUT Request
  Future<T> putServerCall<T extends BaseResponseModel>(
    T obj,
    String url, {
    bool useHeaderToken = false,
    String? headerToken,
    Map<String, dynamic>? body = const {},
  }) async {
    try {
      final response = await dio.put(url, data: body);
      return obj.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

Future<T> deleteServerCall<T extends BaseResponseModel>(
    T obj,
    String serviceName, {
    bool useHeaderToken = false,
    String? headerToken,
    Map<String, dynamic>? queryParameters = const {},
    Map<String, dynamic>? body = const {},
  }) async {
    try {
      final uri = "/appapi/";

      final response = await dio.delete(
        uri,
        queryParameters: {"service": serviceName, ...?queryParameters},
        data: body,
        options: Options(
          headers: {
            if (useHeaderToken && headerToken != null)
              "Authorization": "Bearer $headerToken",
          },
        ),
      );

      logger.d("DELETE uri: $uri?service=$serviceName");
      logger.d("DELETE response: ${response.data}");

      return obj.fromJson(response.data);
    } on DioException catch (e) {
      logger.e("DioException in deleteServerCall: $e");
      rethrow;
    } catch (e) {
      logger.e("Exception in deleteServerCall: $e");
      rethrow;
    }
  }

 }

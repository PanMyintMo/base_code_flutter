import 'dart:io';

import 'package:base_code_flutter/core/network/event_bus_service.dart';
import 'package:base_code_flutter/core/util/perferences.dart';
import 'package:base_code_flutter/features/user/data/models/general_response_model.dart';
import 'package:dio/dio.dart';
class TokenInterceptor extends Interceptor {
  List<Map<dynamic, dynamic>> failedRequests = [];
  bool isRefreshing = false;

  TokenInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Ensure you're not accidentally modifying the token
    if (options.data is Map<String, dynamic>) {
      
    }

    if (Preferences().getAccessToken().isNotEmpty) {
      //Logger.log(msg: "Token ${Preferences().getAccessToken()}");
      options.headers['Authorization'] = Preferences().getAccessToken();
    }
    options.headers['API-REQUEST-FROM'] = Platform.isIOS ? "IOS" : "Android";
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //LogUtils.log(msg: "Response value form api is ${response.data}");
    //
    if (response.data is Map<String, dynamic>) {
      GeneralResponse data = GeneralResponse().fromJson(response.data);
      if (data.data?.code != null && data.data?.code == 700) {
        EventBusService().eventBus.fire(
          "Your login status is invalid, please log in again!",
        );
      }
    }

    handler.next(response);
  }

  }
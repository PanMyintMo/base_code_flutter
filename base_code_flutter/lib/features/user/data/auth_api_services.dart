import 'package:base_code_flutter/core/constants/api_constant.dart';
import 'package:base_code_flutter/core/network/base_api_services.dart';
import 'package:base_code_flutter/core/network/dio.dart';
import 'package:base_code_flutter/features/user/data/models/responses_model/auth_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authApiService = Provider(
  (ref) => AuthApiService(dio: ref.read(dioProvider)),
);

class AuthApiService extends BaseApiServices {
  AuthApiService({required super.dio});
  Future<LoginResponseModel> userLogin(String phone, String password) async {
    return await getServerCall(
      LoginResponseModel(),
      ApiConst.getLoginPath,
      queryParameters: {"user_login": phone, "user_pass": password},
    );
  }
}

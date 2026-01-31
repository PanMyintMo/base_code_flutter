import 'package:base_code_flutter/core/errors/error_handler.dart';
import 'package:base_code_flutter/features/user/data/auth_api_services.dart';
import 'package:base_code_flutter/features/user/data/datassources/remotedatasource/auth_remote_datasource.dart';
import 'package:base_code_flutter/features/user/data/models/responses_model/auth_response_model.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService _authApiService;

  AuthRemoteDataSourceImpl(this._authApiService);
  @override
  Future<LoginResponseModel> userLogin(String phone, String password) async {
    try {
      return _authApiService.userLogin(phone, password);
    } on DioException catch (e) {
      throw ErrorHandler.dioException(error: e);
    } catch (e) {
      throw ErrorHandler.otherException(e.toString());
    }
  }
}

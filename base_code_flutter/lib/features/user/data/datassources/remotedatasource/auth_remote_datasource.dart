import 'package:base_code_flutter/features/user/data/models/responses_model/auth_response_model.dart';

// final authDataSource = Provider(
//   (ref) => AuthRemoteDataSourceImpl(ref.read(authApiService)),
// );

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> userLogin(String phone, String password);
}
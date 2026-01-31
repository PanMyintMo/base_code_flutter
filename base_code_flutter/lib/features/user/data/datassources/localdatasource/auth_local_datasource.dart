import 'package:base_code_flutter/features/user/data/datassources/localdatasource/base_local_datasource_impl.dart';

class AuthLocalDatasource extends BaseLocalDatasourceImpl {
  AuthLocalDatasource(super.prefs);

  Future<void> cacheToken(String token) async {
    await save('auth_token', token);
  }

  Future<String?> getToken() async {
    return await get('auth_token');
  }

  Future<void> clearToken() async {
    await delete('auth_token');
  }
}
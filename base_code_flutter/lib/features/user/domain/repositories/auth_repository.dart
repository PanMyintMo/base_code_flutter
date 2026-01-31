import 'package:base_code_flutter/features/user/domain/entities/auth_entity.dart';

// final authRepositoryProvider = Provider(
//   (ref) => AuthRepositoryImpl(ref.read(authDataSource)),
// );

abstract class AuthRepository {
  Future<LoginEntity> userLogin({
    required String phone,
    required String password,
  });

  void saveLogin(LoginEntity entity);
}

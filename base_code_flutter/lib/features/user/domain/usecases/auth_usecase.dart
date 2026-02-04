import 'package:base_code_flutter/core/util/perferences.dart';
import 'package:base_code_flutter/features/user/domain/entities/auth_entity.dart';
import 'package:base_code_flutter/features/user/domain/repositories/auth_repository.dart';
import 'package:base_code_flutter/features/user/presentation/providers/auth_di_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final makeUserLoginUseCaseProvider = Provider(
  (ref) => MakeUserLoginUseCase(ref.read(authRepositoryProvider)),
);

class MakeUserLoginUseCase {
  final AuthRepository _authRepository;

  MakeUserLoginUseCase(this._authRepository);

  Future<LoginEntity> execute(String phone, String password) async {
    var entity = await _authRepository.userLogin(phone : phone, password : password);
    Preferences().saveAccessToken(entity.token!);
    Preferences().saveLoginInfo(entity);
    return entity;
  }
}
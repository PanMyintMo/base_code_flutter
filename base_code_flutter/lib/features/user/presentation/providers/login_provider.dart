import 'package:base_code_flutter/features/user/domain/usecases/auth_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_code_flutter/core/errors/error_handler.dart';
import 'package:base_code_flutter/core/util/perferences.dart';
import 'package:base_code_flutter/features/user/domain/entities/auth_entity.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState {
  final LoginStatus status;
  final String? msg;
  final LoginEntity? loginEntity;

  const LoginState({
    this.status = LoginStatus.initial,
    this.msg,
    this.loginEntity,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? msg,
    LoginEntity? loginEntity,
  }) {
    return LoginState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      loginEntity: loginEntity ?? this.loginEntity,
    );
  }
}

/// ✅ PROVIDER (this is what UI uses)
final loginProvider =
    NotifierProvider<LoginNotifier, LoginState>(LoginNotifier.new);
class LoginNotifier extends Notifier<LoginState> {
  late final MakeUserLoginUseCase _loginUseCase;

  @override
  LoginState build() {
    // ✅ Dependency injection happens HERE
    _loginUseCase = ref.read(makeUserLoginUseCaseProvider);
    return const LoginState();
  }

  Future<void> login(String phone, String password) async {
    if (phone.isEmpty || password.isEmpty) {
      state = state.copyWith(
        status: LoginStatus.error,
        msg: "Phone or password cannot be empty.",
      );
      return;
    }

    if (phone.startsWith("09") || phone.startsWith("0")) {
      state = state.copyWith(
        status: LoginStatus.error,
        msg: "Invalid Phone Number",
      );
      return;
    }

    try {
      state = state.copyWith(status: LoginStatus.loading);

      final loginEntity =
          await _loginUseCase.execute("09$phone", password);

      Preferences().saveAccessToken(loginEntity.token!);
      Preferences().saveLoginInfo(loginEntity);

      state = state.copyWith(
        status: LoginStatus.success,
        loginEntity: loginEntity,
      );
    } on ErrorHandler catch (e) {
      state = state.copyWith(
        status: LoginStatus.error,
        msg: e.getErrorMessage(),
      );
    }
  }
}
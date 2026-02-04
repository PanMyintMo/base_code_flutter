import 'package:base_code_flutter/features/user/presentation/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginWidget extends ConsumerWidget {
  const LoginWidget({
    super.key,
    required this.phoneController,
    required this.passwordController,
  });

  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    return Column(
      children: [
        TextField(
          controller: phoneController,
          decoration: const InputDecoration(labelText: 'Phone'),
        ),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            ref.read(loginProvider.notifier).login(
                  phoneController.text,
                  passwordController.text,
                );
          },
          child: const Text('Login'),
        ),
        const SizedBox(height: 20),
        if (loginState.status == LoginStatus.loading)
          const CircularProgressIndicator()
        else if (loginState.status == LoginStatus.success)
          Text('Welcome ${loginState.loginEntity?.userNickname ?? ''}')
        else if (loginState.status == LoginStatus.error)
          Text('Error: ${loginState.msg}'),
      ],
    );
  }
}

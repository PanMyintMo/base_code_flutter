import 'package:base_code_flutter/features/user/presentation/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
            // Display login state
            if (loginState.status == LoginStatus.loading)
              const CircularProgressIndicator()
            else if (loginState.status == LoginStatus.success)
              Text('Welcome ${loginState.loginEntity?.getUserId ?? ''}')
            else if (loginState.status == LoginStatus.error)
              Text('Error: ${loginState.msg}'),
          ],
        ),
      ),
    );
  }
}

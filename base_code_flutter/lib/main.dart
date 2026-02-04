import 'package:base_code_flutter/core/util/app_observer.dart';
import 'package:base_code_flutter/features/user/presentation/screens/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
    runApp(
    EasyLocalization(
      // supportedLocales: Languages.values.map((e) => e.locale).toList(),
      // fallbackLocale: Languages.english.locale,
      useFallbackTranslations: true,
      path: 'assets/translations',
      supportedLocales: [],
      child: ProviderScope(observers: [ProviderLogger()], child: MyApp()),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginScreen(),
    );
  }
}

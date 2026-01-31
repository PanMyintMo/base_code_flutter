import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_code_flutter/core/network/dio.dart';
import 'package:base_code_flutter/features/user/data/auth_api_services.dart';
import 'package:base_code_flutter/features/user/data/datassources/remotedatasource/auth_remote_datasource.dart';
import 'package:base_code_flutter/features/user/data/datassources/remotedatasource/auth_remote_datasource_impl.dart';
import 'package:base_code_flutter/features/user/data/repositories/auth_repository_impl.dart';
import 'package:base_code_flutter/features/user/domain/repositories/auth_repository.dart';

/// 1️⃣ Provide AuthApiService
final authApiServiceProvider = Provider<AuthApiService>((ref) {
  return AuthApiService(dio: ref.read(dioProvider));
});

/// 2️⃣ Provide AuthRemoteDataSource
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.read(authApiServiceProvider));
});

/// 3️⃣ Provide AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});



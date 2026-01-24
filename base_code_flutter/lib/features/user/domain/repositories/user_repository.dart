import 'package:base_code_flutter/features/user/domain/entities/user_entity.dart';
import 'package:base_code_flutter/features/user/domain/repositories/base_repository.dart';

abstract class UserRepository extends BaseRepository {
  Future<User> getUser(String id);
  Future<List<User>> getAllUser();
}

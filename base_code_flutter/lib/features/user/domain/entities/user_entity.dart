import 'package:base_code_flutter/features/user/domain/entities/base_entity.dart';

class User extends BaseEntity {
  @override
  final String id;
  final String name;
  final String email;

  User(this.id, {required this.name, required this.email});
}

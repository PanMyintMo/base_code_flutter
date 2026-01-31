import 'package:base_code_flutter/features/user/domain/entities/general_entity.dart';

class User extends GeneralEntity {
  @override
  final String id;
  final String name;
  final String email;

  User(this.id, {required this.name, required this.email, required super.code, required super.msg});
}

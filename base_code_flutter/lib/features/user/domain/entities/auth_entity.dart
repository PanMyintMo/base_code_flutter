import 'dart:convert';

class LoginEntity {
  final String id;
  final String userNickname;
  final String? token;

  final String phone;

  LoginEntity({
    required this.id,
    required this.userNickname,
    required this.phone,
    this.token,
  });

  String get getUserId => "ID:$id";
  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
    id: json["id"],
    userNickname: json["user_nickname"],
    token: json["token"],

    phone: json["phone"],
  );

  factory LoginEntity.fromEncodeJson(String obj) =>
      LoginEntity.fromJson(json.decode(obj));
  String toEncodeJson() => json.encode({
    "id": id,
    "user_nickname": userNickname,
    "token": token,
    "phone": phone,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_nickname": userNickname,
    "phone": phone,
    "token": token,
  };
}



import 'package:base_code_flutter/features/user/data/models/base_response_model.dart';
import 'package:base_code_flutter/features/user/domain/entities/auth_entity.dart';

class LoginResponseModel extends BaseResponseModel {
  int? ret;
  LoginDataModel? data;
  String? msg;

  LoginResponseModel({this.ret, this.data, this.msg});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      ret: json['ret'],
      data: LoginDataModel.fromJson(json['data']),
      msg: json['msg'],
    );
  }
  @override
  fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      ret: json["ret"],
      data: LoginDataModel.fromJson(json['data']),
      msg: json["msg"],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {"ret": ret, "data": data?.toJson(), "msg": msg};
  }
}

class LoginDataModel {
  int? code;
  String? msg;
  List<LoginInfoModel>? info;

  LoginDataModel({this.code, this.msg, this.info});

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
    code: json["code"],
    msg: json["msg"],
    info:
        json['info'] != null
            ? List<LoginInfoModel>.from(
              (json['info']).map((i) => LoginInfoModel.fromJson(i)),
            )
            : [],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": msg,
    "info": info == null ? [] : List<dynamic>.from(info!.map((x) => x.toJson())),
  };
}

class LoginInfoModel {
  String? id;
  String? userNickname;
  String? phone;

  LoginInfoModel({
    this.id,
    this.userNickname,
    this.phone,
  });

  factory LoginInfoModel.fromJson(Map<String, dynamic> json) => LoginInfoModel(
    id: json["id"],
    userNickname: json["user_nickname"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_nickname": userNickname,
    "phone":phone,
  };

  LoginEntity toEntity() {
    return LoginEntity(
      id: id ?? "",
      userNickname: userNickname ?? "",
     
      
      phone: phone ?? "",
    );
  }
}
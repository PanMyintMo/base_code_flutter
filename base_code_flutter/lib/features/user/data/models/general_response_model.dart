
import 'package:base_code_flutter/features/user/data/models/base_response_model.dart';
import 'package:base_code_flutter/features/user/domain/entities/general_entity.dart';

class GeneralResponse extends BaseResponseModel {
  final int? ret;
  final GeneralResponseModel? data;
  final String? msg;

  GeneralResponse({this.ret, this.data, this.msg});

  @override
  Map<String, dynamic> toJson() => {"ret": ret, "data": data?.toJson(), "msg": msg};

  @override
  fromJson(Map<String, dynamic> json) {
    return GeneralResponse(
      ret: json["ret"],
      data: json["data"] == null ? null : GeneralResponseModel.fromJson(json["data"]),
      msg: json["msg"],
    );
  }
}

class GeneralResponseModel extends GeneralEntity {
  GeneralResponseModel({int? code, String? msg})
    : super(code: code ?? -1, msg: msg ?? '');

  factory GeneralResponseModel.fromJson(Map<String, dynamic> json) =>
      GeneralResponseModel(code: json["code"], msg: json["msg"]);

  Map<String, dynamic> toJson() => {"code": code, "msg": msg};
}
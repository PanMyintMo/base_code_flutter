import 'package:base_code_flutter/extensions/ext_encrypt.dart';
import 'package:base_code_flutter/features/user/data/models/responses_model/auth_response_model.dart';
import 'package:base_code_flutter/features/user/domain/entities/auth_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final preferencesProvider = Provider<Preferences>((ref) {
//   final preferences = Preferences();
//   return preferences;
// });

class Preferences {
  late SharedPreferences _prefs;
  final _accessToken = "access_token";
  final _loginInfo = "login_info";
  Preferences._private();

  static final _instance = Preferences._private();

  factory Preferences() {
    return _instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  String getAccessToken() {
    return _prefs.getString(_accessToken)?.aesDecrypt() ?? "";
  }

  LoginEntity getLoginInfo() {
    var entity = _prefs.getString(_loginInfo) ?? "";
    return entity.isEmpty
        ? LoginInfoModel().toEntity()
        : LoginEntity.fromEncodeJson(entity);
  }

  void saveLoginInfo(LoginEntity entity) {
    _prefs.setString(_loginInfo, entity.toEncodeJson());
  }
    void saveAccessToken(String token) {
    _prefs.setString(_accessToken, "Bearer $token".aesEncrypt());
  }


  void clearData() {
    _prefs.remove(_accessToken);
    _prefs.remove(_loginInfo);
  }
}

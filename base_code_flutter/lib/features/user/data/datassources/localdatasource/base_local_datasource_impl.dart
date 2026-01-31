import 'dart:convert';

import 'package:base_code_flutter/features/user/data/datassources/localdatasource/base_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  BaseLocalDatasourceImpl extends BaseLocalDatasource {
  final SharedPreferences prefs;
   BaseLocalDatasourceImpl(this.prefs);
  @override
  Future<void> delete(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<dynamic> get(String key) async {
    final value = prefs.get(key);
    if (value is String) {
      try {
        return jsonDecode(value);
      } catch (e) {
        return value;
      }
    }
  }

  @override
  Future<void> save(String key, data) async {
    if (data is String) {
      await prefs.setString(key, data);
    } else if (data is bool) {
      await prefs.setBool(key, data);
    } else if (data is double) {
      await prefs.setDouble(key, data);
    } else {
      await prefs.setString(key, jsonEncode(data));
    }
  }
}

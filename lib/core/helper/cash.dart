import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static SharedPreferences getSharedPreferences() {
    if (sharedPreferences == null) {
      throw Exception("CacheHelper is not initialized");
    }
    return sharedPreferences!;
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    debugPrint('key: $key value: $value');
    if (value is String) {
      return await sharedPreferences!.setString(key, value).then((value) {

        return value;
      });
    } else if (value is double) {
      return await sharedPreferences!.setDouble(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }

    return await sharedPreferences!.setInt(key, value);
  }

  static dynamic getData({required String key}) {
    var data = sharedPreferences!.get(key);
    return data;
  }

  static Future<bool> removeData({required String key}) {
    return sharedPreferences!.remove(key);
  }
}

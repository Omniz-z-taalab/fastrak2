import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreferences;

  static init() async {
    if (sharedPreferences == null){
      sharedPreferences = await SharedPreferences.getInstance();
    }}

  static Future<dynamic> putData({
    @required String key,
    @required String value,
  }) async {
    return await sharedPreferences.setString(key, value);
  }

  static String getData({
    @required String key,
  }) {
    return sharedPreferences.getString(key);
  }
}

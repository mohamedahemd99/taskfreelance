import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static Future<void> saveString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> saveMap(String key, Map<String, dynamic> jsonMap) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(jsonMap));
  }

  static Future<void> removeValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<Map<String, dynamic>?> getMap<T>(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(key);
    if (value != null) {
      return json.decode(prefs.getString(key)!) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  static Future<bool?> getBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<void> saveBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}

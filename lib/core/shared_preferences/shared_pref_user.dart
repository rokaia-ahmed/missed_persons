import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class PrefUser {
  static SharedPreferences? prefs;
  static const String _keyUser = "UserData";
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// save userData map which is retrieved from the API
  static setUser(Map<String, dynamic> userData) {
    prefs!.setString(_keyUser, jsonEncode(userData));
  }

  /// gets the UserModel saved in the shared preferences
  static UserModel? getUser() {
    UserModel? user;
    String? savedUser = prefs!.getString(_keyUser);
    if (savedUser != null) {
      user = UserModel.fromJson(jsonDecode(savedUser));
    }
    return user;
  }

  static clearUser() {
    prefs!.remove(_keyUser);
  }
}

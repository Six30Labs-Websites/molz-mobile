import 'dart:convert';
import 'dart:ffi';

import 'package:project_molz/src/features/login/data/models/login_with_email_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountManager {
  static SharedPreferences? _preferences;
  // static AccountModel? account;
  static LogInWithEmailModel? userProfileDetail;

  // static const key = 'account';
  static const tokenKey = 'userToken';
  static const userKey = 'userData';
  static const firstTime = 'firstTime';

  static final AccountManager accountManager = AccountManager._internal();

  factory AccountManager() => accountManager;

  AccountManager._internal();

  static initAccountData() async {
    _preferences = await SharedPreferences.getInstance();
    String? data = _preferences?.getString(userKey);
    if (data != null)
      userProfileDetail = LogInWithEmailModel.fromJson(jsonDecode(data));
  }

  static setToken(String token) async {
    await _preferences!.setString(tokenKey, token);
  }

  static Future<String?> getToken() async {
    String? token = _preferences!.getString(tokenKey);
    return token;
  }

  ///User Data Works
  //
  static setUserData(LogInWithEmailModel userProfileDetail) async {
    var accountString = jsonEncode(userProfileDetail.toJson());
    await _preferences?.setString(userKey, accountString);
  }

  static Future<LogInWithEmailModel?> getUserData() async {
    // if (getProfileDetailsModel != null) return getProfileDetailsModel;
    String? data = _preferences!.getString(userKey);
    return userProfileDetail =
        data != null ? LogInWithEmailModel.fromJson(jsonDecode(data)) : null;
  }

  ///User Data Works
  //
  //Removing and Data Deletion Part

  static deleteToken() async {
    _preferences!.clear();
  }

  static deleteUserData() async {
    _preferences!.clear();
    userProfileDetail = null;
  }

  static setFirstTime() async {
    await _preferences?.setBool(firstTime, false);
  }

  static isFirstTime() async {
    return _preferences?.getBool(firstTime) ?? true;
  }
}

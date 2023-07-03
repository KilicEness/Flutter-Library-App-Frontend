import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataModel {
  late String email;
  late String userId;
  late String token;
  late bool isLogin;

  UserLocalDataModel(
      {required this.email,
      required this.userId,
      required this.token,
      required this.isLogin});

  UserLocalDataModel.fromResponse(Map<String, dynamic> json) {
    userId = json['user']['_id'];
    email = json['user']['email'];
    token = json['token'];
  }
}

abstract class ILocalStorage {
  Future<void> setUserData(UserLocalDataModel userLocalDataDto);
  Future<UserLocalDataModel> getUserData();
  Future<void> removeUserData();
  // generic data set and get
  Future<void> setData({required String key, required dynamic value});
  Future<void> removeData(String key);
  Future<dynamic> getData(String key);
}

class SPStorage implements ILocalStorage {
  @override
  Future<UserLocalDataModel> getUserData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    String email = sharedPreferences.getString("email") ?? "";
    String userId = sharedPreferences.getString("userId") ?? "";
    String token = sharedPreferences.getString("token") ?? "";
    bool isLogin = sharedPreferences.getBool("isLogin") ?? false;
    return UserLocalDataModel(
        email: email, userId: userId, token: token, isLogin: isLogin);
  }

  @override
  Future<void> removeUserData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("isLogin");
    sharedPreferences.remove("token");
    sharedPreferences.remove("email");
    sharedPreferences.remove("userId");
  }

  @override
  Future<void> setUserData(UserLocalDataModel userLocalDataDto) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("email", userLocalDataDto.email);
    sharedPreferences.setString("userId", userLocalDataDto.userId);
    sharedPreferences.setString("token", userLocalDataDto.token);
    sharedPreferences.setBool("isLogin", true);
  }

  @override
  Future getData(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }

  @override
  Future<void> removeData(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  @override
  Future<void> setData({required String key, required value}) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, jsonEncode(value));
  }
}

// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  final String email;
  final String password;
  final int rememberMe;
  final int systemUser;

  UserLoginModel({
    required this.email,
    required this.password,
    required this.rememberMe,
    required this.systemUser,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        email: json["email"],
        password: json["password"],
        rememberMe: json["remember_me"],
        systemUser: json["system_user"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "remember_me": rememberMe,
        "system_user": systemUser,
      };
}

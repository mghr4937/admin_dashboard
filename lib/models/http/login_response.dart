// To parse this JSON data, do
//
//     final authResponse = authResponseFromMap(jsonString);

import 'dart:convert';

import 'package:admin_dashboard/models/user.dart';

class LoginResponse {
  LoginResponse({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        user: User.fromMap(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "usuario": user.toMap(),
        "token": token,
      };
}

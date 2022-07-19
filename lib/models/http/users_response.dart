// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromMap(jsonString);
import 'dart:convert';

import 'package:admin_dashboard/models/user_data.dart';

class UsersResponse {
  UsersResponse({
    required this.total,
    required this.usuarios,
  });

  int total;
  List<UserData> usuarios;

  factory UsersResponse.fromJson(String str) => UsersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
        total: json["total"],
        usuarios: List<UserData>.from(json["usuarios"].map((x) => UserData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toMap())),
      };
}

import 'dart:convert';

class User {
  User(
      {required this.role,
      required this.state,
      required this.google,
      required this.name,
      required this.email,
      required this.uid,
      this.img});

  String role;
  bool state;
  bool google;
  String name;
  String email;
  String uid;
  String? img;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        role: json["rol"],
        state: json["estado"],
        google: json["google"],
        name: json["nombre"],
        email: json["correo"],
        uid: json["uid"],
        img: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "rol": role,
        "estado": state,
        "google": google,
        "nombre": name,
        "correo": email,
        "uid": uid,
        "img": img,
      };
}

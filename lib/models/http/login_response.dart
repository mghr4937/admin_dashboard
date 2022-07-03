// To parse this JSON data, do
//
//     final authResponse = authResponseFromMap(jsonString);

import 'dart:convert';

class LoginResponse {
  LoginResponse({
    required this.usuario,
    required this.token,
  });

  Usuario usuario;
  String token;

  factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
      };
}

class Usuario {
  Usuario({
    required this.rol,
    required this.estado,
    required this.google,
    required this.nombre,
    required this.correo,
    required this.uid,
  });

  String rol;
  bool estado;
  bool google;
  String nombre;
  String correo;
  String uid;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        nombre: json["nombre"],
        correo: json["correo"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "rol": rol,
        "estado": estado,
        "google": google,
        "nombre": nombre,
        "correo": correo,
        "uid": uid,
      };
}

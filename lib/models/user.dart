import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class User with ChangeNotifier {
  User({required this.role, required this.name, required this.email, required this.id, this.photoURL});

  String role;

  String name;
  String email;
  String id;
  String? photoURL;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        role: json["rol"],
        name: json["nombre"],
        email: json["correo"],
        id: json["uid"],
        photoURL: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "rol": role,
        "nombre": name,
        "correo": email,
        "uid": id,
        "img": photoURL,
      };

  factory User.fromFirestore(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as dynamic;
    return User(
        id: userDoc.id,
        name: userData['displayName'],
        photoURL: userData['photoURL'],
        email: userData['email'],
        role: '');
  }

  void setFromFireStore(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as dynamic;
    id = userDoc.id;
    name = userData['displayName'];
    photoURL = userData['photoURL'];
    email = userData['email'];
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserData with ChangeNotifier {
  UserData({required this.role, required this.displayName, required this.email, required this.uid, this.photoURL});

  String role = 'ADMIN';
  String displayName;
  String email;
  String uid;
  String? photoURL = 'assets/no-photo.png';

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        role: json["role"],
        displayName: json["displayName"],
        email: json["email"],
        uid: json["uid"],
        photoURL: json["photoURL"],
      );

  Map<String, dynamic> toMap() => {
        "role": role,
        "displayName": displayName,
        "email": email,
        "uid": uid,
        "photoURL": photoURL,
      };

  factory UserData.fromFirebaseAuth(User userFirestore) {
    return UserData(
        uid: userFirestore.uid,
        displayName: userFirestore.displayName!,
        photoURL: 'assets/no-photo.png',
        email: userFirestore.email!,
        role: 'ADMIN');
  }

  //void setFromFireStore(DocumentSnapshot userDoc) {
  //  final userData = userDoc.data() as dynamic;
  //  uid = userDoc.id;
  //  displayName = userData['displayName'];
  //  photoURL = userData['photoURL'];
  //  email = userData['email'];
  //  role = 'ADMIN';
  //  notifyListeners();
  // }
}

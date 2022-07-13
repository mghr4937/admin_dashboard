import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/user.dart';

class UserFormProvider extends ChangeNotifier {
  User? user;
  late GlobalKey<FormState> formkey;

  UserFormProvider();

  Future updateUser() async {
    if (!isValidForm()) return false;
    final data = {'nombre': user!.name, 'correo': user!.email};
    try {
      final response = await CafeApi.httpPut('/usuarios/${user!.uid}', data);
      print(response);
      return true;
    } on DioError catch (e) {
      rethrow;
    }
  }

  bool isValidForm() {
    return formkey.currentState!.validate();
  }

  // void updateListener() {
  //   notifyListeners();
  // }

  copyUserWith({String? role, bool? state, bool? google, String? name, String? email, String? uid, String? img}) {
    user = User(
        role: role ?? user!.role,
        state: state ?? user!.state,
        google: google ?? user!.google,
        name: name ?? user!.name,
        email: email ?? user!.email,
        uid: uid ?? user!.uid,
        img: img ?? user!.img);
    notifyListeners();
  }

  Future<User> uploadImage(String path, Uint8List bytes) async {
    try {
      final response = await CafeApi.uploadFile(path, bytes);
      user = User.fromMap(response);
      notifyListeners();

      return user!;
    } catch (e) {
      print(e);
      throw 'Error subiendo imagen';
    }
  }
}

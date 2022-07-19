import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/user_data.dart';

class UserFormProvider extends ChangeNotifier {
  UserData? user;
  late GlobalKey<FormState> formkey;

  UserFormProvider();

  Future updateUser() async {
    if (!isValidForm()) return false;
    final data = {'nombre': user!.displayName, 'correo': user!.email};
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

  copyUserWith({String? role, String? name, String? email, String? uid, String? img}) {
    user = UserData(
        role: role ?? user!.role,
        displayName: name ?? user!.displayName,
        email: email ?? user!.email,
        uid: uid ?? user!.uid,
        photoURL: img ?? user!.photoURL);
    notifyListeners();
  }

  Future<UserData> uploadImage(String path, Uint8List bytes) async {
    try {
      final response = await CafeApi.uploadFile(path, bytes);
      user = UserData.fromMap(response);
      notifyListeners();

      return user!;
    } catch (e) {
      print(e);
      throw 'Error subiendo imagen';
    }
  }
}

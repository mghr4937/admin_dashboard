import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class LoginProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  LoginProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //TO-DO http requesy
    _token = '<token-must-change>';
    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardPath);
  }

  register(String name, String email, String password) {
    final data = {"nombre": name, "correo": email, "password": password};
    print(data);
    CafeApi.httpPost('/usuarios', data).then((response) {
      print(response);
    }).catchError((e) {
      print('Error en: $e');
      //TODO: notificacion
    });

    //notifyListeners();
    //authStatus = AuthStatus.authenticated;
    //LocalStorage.prefs.setString('token', _token!);
    //NavigationService.replaceTo(Flurorouter.dashboardPath);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
//TODO: ir al backend y comprobar si JWT es valido
    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}

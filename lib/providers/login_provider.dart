import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/models/http/login_response.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class LoginProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  LoginProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    final data = {"correo": email, "password": password};

    CafeApi.httpPost('/auth/login', data).then((response) {
      final authResponse = LoginResponse.fromMap(response);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;

      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardPath);
      CafeApi.configure();
      notifyListeners();
    }).catchError((e) {
      print('Error en: $e');
      NotificationService.showSnackBarError('Oppps, Credenciales Incorrectas :)');
    });
  }

  register(String name, String email, String password) {
    final data = {"nombre": name, "correo": email, "password": password};

    CafeApi.httpPost('/usuarios', data).then((response) {
      final authResponse = LoginResponse.fromMap(response);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;

      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardPath);
      CafeApi.configure();
      notifyListeners();
    }).catchError((e) {
      print('Error en: $e');
      NotificationService.showSnackBarError('Oppps, Email ya registrado :)');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = LoginResponse.fromMap(response);
      LocalStorage.prefs.setString('token', authResponse.token);

      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      //print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}

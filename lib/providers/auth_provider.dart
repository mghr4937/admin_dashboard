import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    //TO-DO http requesy
    _token = '<token>';
    print('Almacenar JWT: $_token');

    //TO-DO nav to dashboard
    notifyListeners();
  }
}

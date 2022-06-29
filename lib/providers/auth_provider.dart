import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    //TO-DO http requesy
    _token = '<token-must-change>';
    LocalStorage.prefs.setString('token', _token!);

    //TO-DO nav to dashboard
    notifyListeners();
  }
}

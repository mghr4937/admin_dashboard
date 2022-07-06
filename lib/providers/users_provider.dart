import 'package:flutter/widgets.dart';
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/user.dart';

class UsersProvider extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = true;

  UsersProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResponse = UsersResponse.fromMap(response);
    users = [...usersResponse.usuarios];
    isLoading = false;
    notifyListeners();
  }
}

import 'package:flutter/widgets.dart';
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/user.dart';

class UsersProvider extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = true;
  bool isAscending = true;
  int? sortColumnIndex;

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

  void sort<T>(Comparable<T> Function(User user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return isAscending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    isAscending = !isAscending;
    notifyListeners();
  }
}

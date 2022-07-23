import 'package:admin_dashboard/models/user_data.dart';
import 'package:flutter/widgets.dart';

class UserDataProvider extends ChangeNotifier {
  List<UserData> users = [];
  bool isLoading = true;
  bool isAscending = true;
  int? sortColumnIndex;

  //final UserDataRepository repository = UserDataRepository();
  UserDataProvider() {
    getUsers();
  }

  getUsers() async {
    //users = FirebaseFirestore.instance.collection('users');

    // final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    // final usersResponse = UsersResponse.fromMap(response);

    isLoading = false;
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(UserData user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return isAscending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    isAscending = !isAscending;
    notifyListeners();
  }

  Future<UserData?> getUserById(String uid) async {
    try {
      // final response = await CafeApi.httpGet('/usuarios/$uid');
      // final userResponse = UserData.fromMap(response);

      // return userResponse;
    } catch (e) {
      return null;
    }
  }

  void refreshUser(UserData newUser) {
    users = users.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }

      return user;
    }).toList();

    notifyListeners();
  }
}

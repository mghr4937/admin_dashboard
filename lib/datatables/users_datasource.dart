import 'package:flutter/material.dart';
import '/services/navigation_service.dart';
import '../models/user_data.dart';

class UsersDataSource extends DataTableSource {
  final List<UserData> users;

  UsersDataSource(this.users);

  @override
  DataRow getRow(int index) {
    final UserData user = users[index];

    final image = (user.photoURL == null)
        ? const Image(image: AssetImage('assets/no-photo.png'), width: 35, height: 35)
        : FadeInImage.assetNetwork(placeholder: 'assets/loader.gif', image: user.photoURL!, width: 35, height: 35);

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(ClipOval(child: image)),
        DataCell(Text(user.displayName)),
        DataCell(Text(user.email)),
        DataCell(Text(user.uid)),
        DataCell(IconButton(
          icon: const Icon(Icons.mode_edit_outlined),
          onPressed: () {
            NavigationService.replaceTo('/dashboard/users/${user.uid}');
          },
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}

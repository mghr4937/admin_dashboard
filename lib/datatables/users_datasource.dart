import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';

class UsersDataSource extends DataTableSource {
  final List<User> users;

  UsersDataSource(this.users);

  @override
  DataRow getRow(int index) {
    final User user = users[index];
    const image = Image(image: AssetImage('no-photo.png'), width: 35, height: 35);
    return DataRow.byIndex(
      index: index,
      cells: [
        const DataCell(ClipOval(child: image)),
        DataCell(Text(user.name)),
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

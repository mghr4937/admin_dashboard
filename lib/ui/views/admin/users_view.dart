import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/labels/custom_labels.dart';
import 'package:admin_dashboard/datatables/users_datasource.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDataSource(usersProvider.users);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text("Usuarios", style: CustomLabels.h1),
          const SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: usersProvider.isAscending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns: [
              DataColumn(label: Text('Foto', style: CustomLabels.h3)),
              DataColumn(
                label: Text('Nombre', style: CustomLabels.h3),
                onSort: (columnIndex, _) {
                  usersProvider.sortColumnIndex = columnIndex;
                  usersProvider.sort<String>((user) => user.name);
                },
              ),
              DataColumn(
                label: Text('Email', style: CustomLabels.h3),
                onSort: (columnIndex, _) {
                  usersProvider.sortColumnIndex = columnIndex;
                  usersProvider.sort<String>((user) => user.email);
                },
              ),
              DataColumn(label: Text('UID', style: CustomLabels.h3)),
              DataColumn(label: Text('Acciones', style: CustomLabels.h3)),
            ],
            source: usersDataSource,
            onPageChanged: (page) {},
          )
        ],
      ),
    );
  }
}

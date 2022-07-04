import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets/labels/custom_labels.dart';
import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final userDataSource = UsersDataSource(usersProvider.users, context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text("Usuarios", style: CustomLabels.h1),
          const SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('Avatar', style: CustomLabels.h3)),
              DataColumn(label: Text('Nombre', style: CustomLabels.h3)),
              DataColumn(label: Text('Email', style: CustomLabels.h3)),
              DataColumn(label: Text('UID', style: CustomLabels.h3)),
              DataColumn(label: Text('Acciones', style: CustomLabels.h3)),
            ],
            source: userDataSource,
          )
        ],
      ),
    );
  }
}

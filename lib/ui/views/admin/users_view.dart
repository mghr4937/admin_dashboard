import 'package:admin_dashboard/models/user_data.dart';
import 'package:admin_dashboard/repositories/firebase/user_data_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '/datatables/users_datasource.dart';
import '/ui/shared/widgets/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final usersProvider = Provider.of<UserDataProvider>(context);
    // final usersDataSource = UserDataSource(usersProvider.users);
    List<UserData> users;
    final UserDataRepository repository = UserDataRepository();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: StreamBuilder<QuerySnapshot>(
          stream: repository.collection.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("There is no users");
            users = snapshot.data!.docs
                .map((e) => UserData.fromMap(e.data() as Map<String, dynamic>))
                .toList();
            final usersDataSource = UserDataSource(users);
            return ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Text("Usuarios", style: CustomLabels.h1),
                const SizedBox(height: 10),
                PaginatedDataTable(
                  //  sortAscending: usersProvider.isAscending,
                  //   sortColumnIndex: usersProvider.sortColumnIndex,
                  columns: [
                    DataColumn(label: Text('Foto', style: CustomLabels.h3)),
                    DataColumn(
                      label: Text('Nombre', style: CustomLabels.h3),
                      //  onSort: (columnIndex, _) {
                      //    usersProvider.sortColumnIndex = columnIndex;
                      //     usersProvider.sort<String>((user) => user.displayName);
                      //     },
                    ),
                    DataColumn(
                      label: Text('Email', style: CustomLabels.h3),
                      //onSort: (columnIndex, _) {
                      //   usersProvider.sortColumnIndex = columnIndex;
                      //   usersProvider.sort<String>((user) => user.email);
                      //  },
                    ),
                    DataColumn(label: Text('UID', style: CustomLabels.h3)),
                    DataColumn(label: Text('Acciones', style: CustomLabels.h3)),
                  ],
                  source: usersDataSource,
                  onPageChanged: (page) {},
                )
              ],
            );
          }),
    );
  }
}
